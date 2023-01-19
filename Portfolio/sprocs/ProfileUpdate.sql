-- LL 100% Great Job!
create or alter procedure dbo.ProfileUpdate(
    @ProfileId int output,  
    @FirstName varchar (35) = '' output,
    @LastName varchar (35) = '' output,
    @PhoneNumber varchar (14) = '' output,
    @EmailAddress varchar (50) = '' output,
    @ProfileDesc varchar (1000) = '' output,
    @GitHubAccount varchar (100) = '' output,
    @HasResume bit = 1 output,
    @Message VARCHAR(1000) = '' OUTPUT
)
as 
begin 
    DECLARE @return int = 0
     select @ProfileId = isnull(@ProfileId, 0)

--only do insert 
 if @ProfileId = 0
  begin
        insert Profile(FirstName, LastName, EmailAddress, PhoneNumber, GitHubAccount, ProfileDesc, HasResume)
        values(@FirstName, @LastName,@EmailAddress, @PhoneNumber, @GitHubAccount, @ProfileDesc, @HasResume)
    
        select @ProfileId = scope_identity()
  end
     
     --else do update
     else 
     begin
      if(@PhoneNumber <> (select PhoneNumber from Profile p where p.ProfileId  = @ProfileId))
      begin 
          SELECT @return = 1, @Message = 'You can''t change existing profile phone number.'
          goto finished
      end
      update p set  
        FirstName = @FirstName,
        LastName = @LastName,
        PhoneNumber = @PhoneNumber,
        EmailAddress = @EmailAddress,
        ProfileDesc = @ProfileDesc,
        GitHubAccount = @GitHubAccount,
        HasResume = @HasResume
      from Profile p
      where p.ProfileId = @ProfileId
  end

finished:
    return @return 
 end
go 