import React, { useState, useEffect, useRef } from 'react';
import { GetDataTable } from './utility'

export function TrySQL(props) {
    const dbname = props.dbname;
    const [results, setResults] = useState([]);
    const [sql, setSql] = useState("");
    const txtsql = useRef(null);
    useEffect(() => {
        (
            async () => {
                if (sql != "") {
                    const resultsobj = await GetDataTable(dbname, sql);
                    setResults(resultsobj);
                }
            }
        )();
    }, [sql]);
   
    console.log(results);
    return (
        <div>
            <div className="row">
                <div className="col-md-12">
                    <textarea ref={txtsql}  cols="100" rows="4"/>
                </div>
            </div>
            <div className="row">
                <div className="col-md-3">
                    <button className="btn-btn-success" onClick={() => setSql(txtsql.current.value)}>Run SQL</button>
                </div>
            </div>
            <div className="row">
            </div> 
            <div className="row">
                <div className="col-md-12">
                    { (results.length > 0) ?
                        <table className="table">
                            <tbody>
                                <tr>{Object.keys(results[0]).map((col, index) => <th key={index}>{col}</th>)}</tr>
                                {results.map((item, index) => <tr key={index}>
                                    {Object.values(item).map((value, valueindex) => <td key={valueindex}>{value}</td>)}
                                </tr>)}
                            </tbody>
                        </table>
                        :null
                    }
                </div>
            </div>
        </div>
    )

}