import React, { useState, useEffect } from 'react';
import { GetDevToolType } from './utility';

export function DevToolType(props) {
    const [devtooltypes, setDevToolTypes] = useState([]);
    const devtooltype = props.devtoolType;

    useEffect(() => {
        (
            async () => {
                const devtooltypeobj = await GetDevToolType();
                setDevToolTypes(devtooltypeobj);
            }
        )();
    }, []);

    if (devtooltypes.length == 0) { return <p>Loading...</p> }
}