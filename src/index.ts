import express from "express";
import { userRoutes } from "./routes/users.routes";

const app = express();

app.use(express.json());

app.use("/user", userRoutes);

export { app }
