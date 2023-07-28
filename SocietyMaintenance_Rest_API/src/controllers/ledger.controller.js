const ledgerModels = require("../models/ledger.model");

const getLedgerDetailsByMember = (req, res) => {
  ledgerModels
    .findledgerDetailsByMember(req.params.memberId)
    .then((results) => {
      res.status(200).json(results);
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to get ledger details for member from db",
        err,
      });
    });
};

const getPendingDuesAllMembers = (req, res) => {
  ledgerModels
    .findPendingDuesAllMembers()
    .then((results) => {
      res.status(200).json(results);
    })
    .catch((err) => {
      res.status(500).json({
        mesage: "Unable to get ledger details for member from db",
        err,
      });
    });
};

const payDues = (req, res) => {
  if (res.locals.validatedInput.amountPeriod === "1M") {
    ledgerModels
      .createTransaction(res.locals.validatedInput.memberId)
      .then(() => {
        ledgerModels
          .updateDueDate(res.locals.validatedInput.memberId)
          .then((count) => {
            if (count > 0) {
              ledgerModels
                .updateDueAmount(res.locals.validatedInput.memberId)
                .then(() => {
                  res.status(200).send("Transaction SuccessFull");
                })
                .catch((err) => {
                  res.status(500).json({
                    mesage: "Due Amount cannot be updated",
                    err,
                  });
                });
            } else {
              res.status(500).send("Due Date cannot be updated");
            }
          })
          .catch((err) => {
            res.status(500).json({
              mesage: "Encountered problem while updating due date",
              err,
            });
          });
      })
      .catch((err) => {
        res.status(500).json({
          mesage: "Unable to make entry for transaction ",
          err,
        });
      });
  } else {
    if (new Date().getMonth() === 4) {
      ledgerModels
        .updateDueDateByOneYear(res.locals.validatedInput.memberId)
        .then((count) => {
          if (count > 0) {
            ledgerModels
              .updateDueAmount(res.locals.validatedInput.memberId)
              .then(() => {
                res
                  .status(200)
                  .send(
                    "Transaction complete, your one month charges are waived off"
                  );
              })
              .catch((err) => {
                res.status(500).json({
                  mesage: "Due Amount cannot be updated",
                  err,
                });
              });
          } else {
            res.status(500).send("Due Date cannot be updated");
          }
        })
        .catch((err) => {
          res.status(500).json({
            mesage: "Encountered problem while updating due date",
            err,
          });
        });
    } else {
      res.status(401).json({
        mesage: "You can avail this offer only in the month of April",
      });
    }
  }
};

module.exports = {
  getLedgerDetailsByMember,
  getPendingDuesAllMembers,
  payDues,
};
