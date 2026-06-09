import express from 'express';
import cors from 'cors';
import dataRoutes from './routes/data.routes.js';

const app = express();

// Middleware
app.use(cors());
app.use(express.json()); 
app.use(express.urlencoded({ extended: true })); 

// Routes setup
app.use('/api/data', dataRoutes);

export default app;
