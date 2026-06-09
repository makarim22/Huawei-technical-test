import express from 'express';
import * as dataController from '../controllers/data.controller.js';
const router = express.Router();

// Post data
router.post('/', dataController.createData);

// Get All Data
router.get('/', dataController.getData);

export default router;
