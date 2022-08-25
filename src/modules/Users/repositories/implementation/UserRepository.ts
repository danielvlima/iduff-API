import { User, typeUser } from "../../model/User";
import { ICreateUserDTO, IUserRepository } from "../IUserRepository";


class UserRepository implements IUserRepository {

    private users: User[];

    private static INSTANCE: UserRepository;

    private constructor() {
        this.users = [];
    }

    public static getInstance(): UserRepository {
        if(!UserRepository.INSTANCE){
            UserRepository.INSTANCE = new UserRepository();
        }

        return UserRepository.INSTANCE;
    }

    create({ name, nacionality, state, RG, cpf, email, password, birthDate, typeUser }: ICreateUserDTO): User {
        let user = new User;
        Object.assign(user, {
            name,
            nacionality,
            state,
            RG,
            cpf,
            email,
            password,
            birthDate,
            typeUser,
        })
        
        this.users.push(user);
        
        return user;
    }

    findByCPF(cpf: string): User | undefined {
        const user = this.users.find(user => user.cpf === cpf);

        return user;
    }

    list(): User[]{
        return this.users;
    }

}

export { UserRepository };