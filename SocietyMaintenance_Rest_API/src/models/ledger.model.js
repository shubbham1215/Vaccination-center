const sequelize = require("./connection");

const methods = {};

methods.findledgerDetailsByMember = (memberId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `SELECT m.id,m.firstName,m.lastName,l.dueAmount,l.dueDate
        from society_maintenance.ledger l
        inner join society_maintenance.member m on l.memberId=m.id
        where l.memberId=?;`,
        {
          replacements: [parseInt(memberId)],
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

methods.findPendingDuesAllMembers = () => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `SELECT l.id,m.firstName,m.lastName,m.phone,l.dueAmount,l.dueDate
        FROM society_maintenance.ledger l
        INNER JOIN society_maintenance.member m on l.memberId=m.id
        WHERE IF(DATEDIFF(l.dueDate,CURDATE()) >=  0, null , l.memberId) is not null;`,
        {
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

methods.updateDueDate = (memberId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `update society_maintenance.ledger
        set dueDate= dueDate + INTERVAL 1 MONTH
        where memberId=?;`,
        {
          replacements: [parseInt(memberId)],
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

methods.updateDueDateByOneYear = (memberId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `update society_maintenance.ledger
        set dueDate= dueDate + INTERVAL 1 YEAR
        where memberId=?;`,
        {
          replacements: [parseInt(memberId)],
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

methods.updateDueAmount = (memberId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `update society_maintenance.ledger l
        inner join society_maintenance.member m  on l.memberId=m.id
        inner join society_maintenance.premise p on p.memberId=m.id
        inner join society_maintenance.premise_types pt on p.premiseTypeId=pt.id
        set l.dueAmount=CASE WHEN  ( p.renterId is null) Then pt.maintenanceFee
                             ELSE  pt.maintenanceFee + 500 
                        END
        where l.memberId=?;`,
        {
          replacements: [parseInt(memberId)],
          type: sequelize.QueryTypes.UPDATE,
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

methods.createTransaction = (memberId) => {
  return new Promise((resolve, reject) => {
    sequelize
      .query(
        `INSERT INTO society_maintenance.transaction(amount,memberId) 
        select dueAmount,memberId
        from society_maintenance.ledger
        where memberId =?;`,
        {
          replacements: [[parseInt(memberId)]],
          type: sequelize.QueryTypes.INSERT,
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

module.exports = methods;
