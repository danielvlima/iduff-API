import { User } from "../../model/User";
import { UserRepository } from "../../repositories/implementation/UserRepository";

interface IRequest {
    name: string;
    nacionality: string;
    state: string;
    RG: string;
    cpf: string;
    email: string;
    password: string;
    birthDate: Date;
    type: {
        enum: ["director", "student"]; //COMPLETAR!!!!!!!!!!!!!!!!!!!!
    }; //pesquisar enum typeorm

} 


class CreateUserUseCase {
    constructor(private userRepository: UserRepository){}
    
    execute(userRequest: IRequest): User{
        const user = this.userRepository.create(userRequest);

        return user;
    }

}

export { CreateUserUseCase };