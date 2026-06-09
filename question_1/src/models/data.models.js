// buat in-memory data store
const formDataStorage = [];

/**
 * fungsi get all data
 * @returns {Array} mengembalikan seluruh data 
 */
export const getAllData = () => {
    return formDataStorage;
};

/**
 * fungsi menambahkan data
 * @param {Object} data - data yang akan ditambahkan/disimpan
 * @returns {Object} entri data dengan id dan timestamp
 */
export const addData = (data) => {
    const entry = {
        id: Date.now(),
        ...data,
        createdAt: new Date().toISOString()
    };
    
    formDataStorage.push(entry);
    return entry;
};
