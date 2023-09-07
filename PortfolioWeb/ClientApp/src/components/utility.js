const baseurl = "/profile/";

export async function GetProfile() {
    const p = await FetchFromAPI("")
    return p;
}

export async function GetDevSections() {
    const d = await FetchFromAPI("devsections")
    return d;
}

export async function GetDevSubsections() {
    const d = await FetchFromAPI("devsubsections")
    console.log("GetDevSubsections", d);
    return d;
}

export async function GetDevSubsectionElements() {
    const d = await FetchFromAPI("devsubsectionelements")
    return d;
}

export async function GetDevTools(DevSubsectionCode) {
    let url = "devtools";
    if (DevSubsectionCode != "" && DevSubsectionCode != null) {
        url = "devtoolsforsubsection?DevSubsectionCode=" + DevSubsectionCode;
    }
    const t = await FetchFromAPI(url);
    return t;
}

export async function GetDevToolTypes() {
    const t = await FetchFromAPI("devtooltypes")
    return t;
}
//devsubsectionqueries
export async function GetDevSubsectionQueries() {
    return await FetchFromAPI("devsubsectionqueries")

}

export async function GetDataTable(dbname, sql) {

    const t = await FetchFromAPI("trysql?dbname=" + dbname + "&sql=" + sql)
    return t;
}
async function FetchFromAPI(apiurl) {
    const resp = await fetch(baseurl + apiurl);
    const json_array = await resp.json();
    return json_array;
}
export async function GetSQLScipt(fileurl) {
    let sqlscript = await FetchFromFile(fileurl);
    sqlscript = FormatSQLHasHtml(sqlscript);
    return sqlscript;
}
export async function GetCodeScript(fileurl, codetype) {
    let codescript = await FetchFromFile(fileurl);
    console.log("codetype", codetype);
    switch (codetype) {
        case "scriptsql":
            codescript = FormatSQLHasHtml(codescript);
            break;
        case "scriptcsharp":
            codescript = FormatCSharpHasHtml(codescript);
    }
    return codescript;
}

export async function FetchFromFile(fileurl) {
    const resp = await fetch(fileurl);
    let contents = await resp.text();
    return contents;
}
function DoFormatArray(wholevalue, classvalue, arrayvalue) {
    arrayvalue.forEach(x => wholevalue = DoFormat(wholevalue, x, classvalue));
    return wholevalue;
}

function DoFormat(wholevalue, findvalue, classvalue) {
    return wholevalue.replaceAll(findvalue, "<span class=\"" + classvalue + "\">" + findvalue + "</span>")
}

function FormatCSharpHasHtml(code) {
    code = code.replace(/(?:\r\n|\r|\n)/g, '<br>');
    return DoFormatArray(code, "csharp", ["public class", "protected ", "private "]);
}
function FormatSQLHasHtml(sql) {
    let s = sql.toString();
    s = s.replace(/(?:\r\n|\r|\n)/g, '<br>');
    s = s.replace("sys.databases", "<span class=\"sqlgreen\">sys.databases</span>");
    s = s.replace(/if /g, "<span class=\"sql\">if </span>");
    s = s.replace(/select/g, "<span class=\"sql\">select</span>");
    s = s.replace(/from/g, "<span class=\"sql\">from</span>");
    s = s.replace(/where/g, "<span class=\"sql\">where</span>");
    s = s.replace(/begin/g, "<span class=\"sql\">begin</span>");
    s = s.replace(/end/g, "<span class=\"sql\">end</span>");
    s = s.replace(/use /g, "<span class=\"sql\">use </span>");
    s = s.replace(/ int/g, "<span class=\"sql\"> int</span>");
    s = s.replace(/varchar/g, "<span class=\"sql\">varchar</span>");
    s = s.replace(/create database/g, "<span class=\"sql\">create database</span>");
    s = DoFormatArray(s, "sql", ["create table", "primary key", "identity"])

    s = s.replace(/foreign key references/g, "<span class=\"sql\">foreign key references</span>");
    s = s.replace(/datetime/g, "<span class=\"sql\">datetime</span>");
    s = s.replace(/date /g, "<span class=\"sql\">date </span>");
    s = s.replace(/go/g, "<span class=\"sql\"> go</span>");
    s = s.replace(/constraint/g, "<span class=\"sql-constraint\">constraint</span>");
    s = s.replace(/ unique/g, "<span class=\"sql\"> unique</span>");
    s = s.replace(/check/g, "<span class=\"sql\">check</span>");
    s = s.replace(/ as /g, "<span class=\"sql\"> as </span>");
    s = s.replace(/bit /g, "<span class=\"sql\">bit </span>");
    s = s.replace(/default /g, "<span class=\"sql\">default </span>");
    s = s.replace(/ char/g, "<span class=\"sql\"> char</span>");
    s = s.replace(/decimal/g, "<span class=\"sql\">decimal</span>");
    s = s.replace(/identifier /g, "<span class=\"sql\">identifier </span>");
    s = s.replace(/money /g, "<span class=\"sql\">money </span>");
    s = s.replace(/dec/g, "<span class=\"sql\">dec</span>");
    s = s.replace(/.name/g, "<span class=\"sql\">.name</span>");
    s = s.replace(/null/g, " <span class=\"sqlgrey\">null</span>");
    s = s.replace(/not /g, "<span class=\"sqlgrey\">not </span>");
    s = s.replace(/exists/g, "<span class=\"sqlgrey\">exists</span>");
    s = s.replace(/\(/g, "<span class=\"sqlgrey\">(</span>");
    s = s.replace(/\)/g, "<span class=\"sqlgrey\">)</span>");
    s = s.replace(/<>/g, "<span class=\"sqlgrey\"><></span>");
    s = s.replace(/>=/g, "<span class=\"sqlgrey\">>=</span>");
    s = s.replace(/<=/g, "<span class=\"sqlgrey\"><=</span>");
    s = s.replace(/ = /g, "<span class=\"sqlgrey\"> = </span>");
    s = s.replace(/ > /g, "<span class=\"sqlgrey\"> > </span>");
    s = s.replace(/ < /g, "<span class=\"sqlgrey\"> < </span>");
    s = s.replace(/,/g, "<span class=\"sqlgrey\">,</span>");
    s = s.replace("+", "<span class=\"sqlgrey\">+</span>");
    s = s.replace(/newid/g, "<span class=\"sqlpink\">newid</span>");
    s = s.replace(/getdate/g, "<span class=\"sqlpink\">getdate</span>");
    s = s.replace(/convert/g, "<span class=\"sqlpink\">convert</span>");
    s = s.replace(/'/g, "<span class=\"sqlred\">'</span>");
    return s;
}