const sequelize = require("./connection");

const methods = {};

methods.find = () => {
  return new Promise((resolve, reject) => {
    sequelize
      .query("SELECT * FROM society_maintenance.premise", {
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

methods.create = (premiseDetails) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `INSERT INTO society_maintenance.premise(premiseTypeId,premiseNo) VALUES (?,?);`,
        {
          replacements: [
            premiseDetails.premiseTypeId,
            premiseDetails.premiseNo,
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

methods.updateOwnerByPremiseId = (details) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `update society_maintenance.premise 
        set memberId=? 
        where id=?;`,
        {
          replacements: [
            parseInt(details.memberId),
            parseInt(details.premiseId),
          ],
          type: sequelize.QueryTypes.UPDATE,
        }
      )
      .then((count) => {
        resolve(count[1]);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

methods.updateRenterByPremiseId = (details) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `update society_maintenance.premise 
        set renterId=? 
        where id=?;`,
        {
          replacements: [
            parseInt(details.renterId),
            parseInt(details.premiseId),
          ],
          type: sequelize.QueryTypes.UPDATE,
        }
      )
      .then((count) => {
        resolve(count[1]);
      })
      .catch((err) => {
        reject(err);
      });
  });
};

methods.ownerExists = (premiseId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        "SELECT memberId FROM society_maintenance.premise where id=? and memberId is not null ",
        {
          replacements: [parseInt(premiseId)],
          type: sequelize.QueryTypes.SELECT,
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
