import * as dataModel from '../models/data.model.js';

/**
 * controller yang menghandle post /api/data
 * menerima form dan menyimpannya
 */
export const createData = (req, res) => {
    const data = req.body;
    
    // Simple validation
    if (!data || Object.keys(data).length === 0) {
        return res.status(400).json({ error: 'No data provided' });
    }

    const savedEntry = dataModel.addData(data);
    console.log('New data received and stored:', savedEntry);

    return res.status(201).json({
        message: 'Data successfully saved',
        data: savedEntry
    });
};

/**
 * controller yang menhandle get /api/data
 * mengambil semua data.
 */
export const getData = (req, res) => {
    const storedData = dataModel.getAllData();
    return res.status(200).json({
        message: 'Data retrieved successfully',
        data: storedData
    });
};
