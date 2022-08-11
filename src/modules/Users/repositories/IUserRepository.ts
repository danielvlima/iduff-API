import { User } from "../model/User";


interface ICreateUserDTO {
    name: string;
    nacionality: string;
    state: string;
    RG: string;
    cpf: string;
    email: string;
    password: string;
    birthDate: Date;
}

interface IUserRepository {
    create({name, nacionality, state, RG, cpf, email, password, birthDate}: ICreateUserDTO): User;
    findByCPF(cpf: string): User | undefined;
    list(): User[];
}

export { ICreateUserDTO, IUserRepository };