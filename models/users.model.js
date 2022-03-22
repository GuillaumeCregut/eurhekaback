const connection = require("../db-config");
const Joi = require('joi');
const argon2 = require('argon2');
const { userRole } = require('../utils/definitions');
const db = connection.promise();

const hashingOptions = {
    type: argon2.argon2id,
    memoryCost: 2 ** 16,
    timeCost: 5,
    parallelism: 1,
};

const validate = (data, forCreation = true) => {
    const presence = forCreation ? 'required' : 'optional';
    return Joi.object({
        email: Joi.string().email().max(255).presence(presence),
        firstname: Joi.string().max(255).presence(presence),
        lastname: Joi.string().max(255).presence(presence),
        password: Joi.string().min(8).max(50).presence(presence),
        options: Joi.number().integer().presence('optional')
    }).validate(data, { abortEarly: false }).error;
}

const validateLevel=(data)=>{
    return Joi.object({
       user_level: Joi.number().integer().min(2).max(5).presence('required')
    }).validate(data, { abortEarly: false }).error;
}

const validateLogin = (data) => {
    return Joi.object({
        email: Joi.string().email().max(255).presence('required'),
        password: Joi.string().min(8).max(50).presence('required'),
    }).validate(data, { abortEarly: false }).error;
}

const hashPassword = (plainPassword) => {
    return argon2.hash(plainPassword, hashingOptions);
};

const findOneByMail = (email) => {
    return db
        .query("SELECT id_users FROM users WHERE email=?", [email])
        .then(([result]) => result[0])
        .catch((err)=>{
            console.log(err);
            return err;
        })
}

const findOneById = (id) => {
    return db
        .query("SELECT id_users FROM users WHERE id_users=?", [id])
        .then(([result]) => result[0])
        .catch((err)=>{
            console.log(err);
            return err;
        })
}
const findOneByMailForLogin = (email) => {
    return db
        .query("SELECT id_users,password,user_level,firstname,lastname FROM users WHERE email=?", [email])
        .then(([result]) => result[0])
        .catch((err)=>{
            console.log(err);
            return err;
        })
}

const create = async ({ firstname, lastname, password, email, options }) => {
    const hashedPassword = await hashPassword(password);
    return db
        .query("INSERT INTO users (firstname,lastname, email,password,signin_options,user_level) VALUES(?,?,?,?,?,?)",
            [firstname, lastname, email, hashedPassword, options, userRole.USER])
        .then(([result]) => {
            const lastId = result.insertId;
            return lastId;
        })
        .catch((err) => {
            console.error(err);
            return err;
        });

}
const checkPassword = (plainPassword, hashedPassword) => {
    return argon2.verify(hashedPassword, plainPassword, hashingOptions);
}

const findAll=()=>{
    return db
        .query("SELECT id_users,userName, user_level, name FROM view_user_admin ORDER BY userName")
        .then(([result])=>{
            return result
        })
        .catch((err)=>{
            console.log(err);
            return err;
        })
}

const destroy=(idUser)=>{
    return db
        .query("DELETE FROM users WHERE id_users=?",[idUser])
        .then(([result])=>{
            return result.affectedRows!==0;
        })
        .catch((err)=>{
            console.log(err);
            return err;
        })
}

const updateLevelUser=(id,level)=>{
    return db
        .query("UPDATE users SET user_level=? WHERE id_users=?",[level,id])
        .then(([result])=>{
            return result.affectedRows!==0
        })
        .catch((err)=>{
            console.log(err);
            return err;
        })
}
module.exports = {
    validate,
    hashPassword,
    create,
    findOneByMail,
    validateLogin,
    findOneByMailForLogin,
    checkPassword,
    findAll,
    destroy,
    updateLevelUser,
    findOneById,
    validateLevel,
}