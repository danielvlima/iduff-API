
enum typeUser {
    director = 'director',
    student = 'student'
}


class User {
    name: string;
    nacionality: string;
    state: string;
    RG: string;
    cpf: string;
    email: string;
    password: string;
    birthDate: Date;
    typeUser: typeUser;  //pesquisar enum typeorm

}

export { User, typeUser };