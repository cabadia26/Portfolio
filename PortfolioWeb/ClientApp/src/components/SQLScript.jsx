import React, { useState, useEffect } from 'react';
import { GetSQLScipt } from './utility';

export function SQLScript(props) {
    const [filecontents, setFilecontents] = useState("");
    const fileurl = props.dirpath;
    useEffect(() => {
        (
            async () => {

                const filecontentsval = await GetSQLScipt(fileurl);
                setFilecontents(filecontentsval);
            }
        )();
    }, [fileurl]);

    if (filecontents == "") return <p>Loading...</p>;
    console.log(filecontents)

    return (
        <div className="code" dangerouslySetInnerHTML={{ __html: filecontents }} />
    )
}