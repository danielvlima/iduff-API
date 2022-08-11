import { Router } from "express";
import { createUserController } from "../modules/Users/useCases/createUser";


const userRoutes = Router();

userRoutes.post("/", (req, res) => 
    createUserController.handle(req, res)
);

export { userRoutes }