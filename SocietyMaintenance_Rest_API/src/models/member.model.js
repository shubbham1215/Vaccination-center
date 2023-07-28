const sequelize = require("./connection");

const methods = {};

methods.create = (member) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `INSERT INTO society_maintenance.member
        (firstName,lastName,email,phone,aadharNo,dob)VALUES(?,?,?,?,?,?);`,
        {
          replacements: [
            member.firstName,
            member.lastName,
            member.email,
            member.phone,
            member.aadharNo,
            member.dob,
          ],
          type: sequelize.QueryTypes.Insert,
        }
      )
      .then(() => {
        resolve();
      })
      .catch((err) => {
        reject(err);
      });
  });
};

methods.findMembersAndPremises = () => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `select m.*,p.premiseNo
        from society_maintenance.premise p
        inner join society_maintenance.member m on p.memberId=m.id;`,
        {
          type: sequelize.QueryTypes.Select,
        }
      )
      .then((results) => {
        resolve(results);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

module.exports = methods;
