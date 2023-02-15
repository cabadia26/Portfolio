import React, { useState, useEffect } from 'react';
import { GetDataTable } from './utility'

export function TrySQL(props) {
    const dbname = props.dbname;
    const [results, setResults] = useState([]);
    useEffect(() => {
        (
            async () => {
                const resultsobj = await GetDataTable(dbname, "select * from devtool");
                setResults(resultsobj);
            }
        )();
    }, []);
    if (results.length == 0) { return <p>Loading...</p> }
    console.log(results);
    return (
        <div>
            <div className="row">
                <div className="col-md-12">
                    <textarea cols="100" rows="4"/>
                </div>
            </div>
            <div className="row">
                <div className="col-md-3">
                    <button className="btn-btn-success">Run SQL</button>
                </div>
            </div>
            <div className="row">
            </div> 
            <div className="row">
                <div className="col-md-12">
                    <table className="table">
                        <tbody>
                            <tr>{Object.keys(results[0]).map(col => <th>{col }</th>) }</tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )

}