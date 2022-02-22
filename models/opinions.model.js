const connection = require("../db-config");
const Joi = require('joi');

const db = connection.promise();

const validate = (data, forCreation = true) => {
    const presence = forCreation ? 'required' : 'optional';
    return Joi.object({
        enterprise: Joi.number().integer().min(0).presence(presence),
        user: Joi.number().integer().min(0).presence(presence),
        opinion: Joi.string().presence(presence)
    }).validate(data, { abortEarly: false }).error;
}

const findOne=(id)=>{
    return db
    .query("SELECT id_opinion, is_valid, opinion, CONCAT(firstname,' ',lastname) as author FROM view_opinion WHERE id_opinion=?",[id])
    .then(([result])=>result[0])
    .catch((err) => console.error(err));
}

const findAll = () => {
    return db
    .query("SELECT id_opinion, is_valid, opinion, CONCAT(firstname,' ',lastname) as author FROM view_opinion")
    .then(([result])=> result)
    .catch((err) => console.error(err));
}

const findAllByEnterprise = (id) => {
    return db.query("SELECT opinion, CONCAT(firstname,' ',lastname) as author FROM view_opinion WHERE is_valid=1 and id_enterprise=?;", [id])
        .then(([result]) => result)
        .catch((err) => console.error(err));
}

const create=({user, enterprise,opinion})=>{
    return db
    .query('INSERT INTO opinion (id_user,opinion,id_enterprise) VALUES (?,?,?)',[user,opinion,enterprise])
    .then(([result])=>{
        const lastId=result.insertId;
        const isValid=false;
        return{lastId,user,enterprise,opinion,isValid};
    })
    .catch((err)=>console.error(err));
}

module.exports = {
    findAllByEnterprise,
    validate,
    findAll,
    findOne,
    create,
}