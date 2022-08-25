import { Request, Response } from "express";
import { CreateUserUseCase } from "./createUserUseCase";


class CreateUserController {
    constructor(private createUserUseCase: CreateUserUseCase){}

    handle(req: Request, res: Response){
        const requestData = req.body

        const user = this.createUserUseCase.execute(requestData)

        return res.status(201).json(user);

    }

}

export { CreateUserController };