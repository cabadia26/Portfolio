import React, { useState, useEffect } from 'react';
export function TrySQL(props) {
    const dbname = props.dbname;
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
            </div>


        </div>
    )

}