const sequelize = require("./connection");

const methods = {};

methods.create = (renter) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `INSERT INTO society_maintenance.renter
          (firstName,lastName,email,phone,aadharNo,dob)VALUES(?,?,?,?,?,?);`,
        {
          replacements: [
            renter.firstName,
            renter.lastName,
            renter.email,
            renter.phone,
            renter.aadharNo,
            renter.dob,
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

methods.findRenters = () => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(`select * from society_maintenance.renter ;`, {
        type: sequelize.QueryTypes.SELECT,
      })
      .then((results) => {
        resolve(results);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

module.exports = methods;
