import React, { useState, useEffect } from 'react';
import { GetProfile, GetDevSections, GetDevToolType } from './utility';
import { DevTool } from './DevTool';

function Home() {
    const [profile, setProfile] = useState({});
    const [devsections, setDevSections] = useState([]);
    const [devtooltypes, setDevTooltypes] = useState([]);
    useEffect(() => {
        (
            async () => {
                const profileobj = await GetProfile();
                setProfile(profileobj);

                const devsectionsobj = await GetDevSections();
                setDevSections(devsectionsobj);

                const devtooltypesobj = await GetDevToolType();
                setDevTooltypes(devtooltypesobj);
            }
        )();
    }, []);

    if (profile.profileDesc == null || devsections.length == 0) { return <p>Loading...</p> }
    const devtooltypesforhome = devtooltypes.filter(d => d.showOnHomePage == true)
    console.log("devtooltypesforhome", devtooltypesforhome);
    return (
        <div>
            <p className="bg-light m-5 p-3 h5">{profile.profileDesc}</p>
            <div className="row my-2">
                <div className="col-md-12">
                    <DevTool toolType="skill" caption="My Skills" subsectionCode="" />
                </div>
            </div>
            <div className="row my-2">
                <div className="col-md-12">
                    <DevTool toolType="language" caption="My Tools and Technologies" subsectionCode="" />
                </div>
            </div>
            <div className="row">
                {devsections.map(d =>
                    <div key={d.devSectionCode} className="col-md-3">
                        <div className="card">
                            <div className="card-header">{d.devSectionName}</div>
                            <div className="card-body">{d.devSectionBlurb}</div>
                        </div>
                    </div>)}
            </div>
        </div>
    );

}
export default Home;
