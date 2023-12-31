CREATE TABLE `data_platform_production_order_confirmation_header_data`
(
		`ProductionOrder`                            int(16) NOT NULL,
    	`ProductionOrderItem`                        int(6) NOT NULL,
        `Operations`                                 int(16) NOT NULL,
        `OperationsItem`                             int(6) NOT NULL,
        `OperationID`                                int(4) NOT NULL,
        `ConfirmationCountingID`                     int(4) NOT NULL,
        `OperationPlannedQuantityInBaseUnit`         float(15) NOT NULL,
        `OperationPlannedQuantityInProductionUnit`   float(15) NOT NULL,
        `OperationPlannedQuantityInOperationUnit`    float(15) NOT NULL,
        `ProductBaseUnit`                          	 varchar(3) NOT NULL,
		`ProductProductionUnit`						 varchar(3) NOT NULL,
        `ProductOperationUnit`                       varchar(3) NOT NULL,
        `OperationPlannedScrapInPercent`             float(7) DEFAULT NULL,
        `ConfirmationEntryDate`                      date DEFAULT NULL,
        `ConfirmationEntryTime`                      time DEFAULT NULL,
        `ConfirmationText`                           varchar(200) DEFAULT NULL,
        `IsFinalConfirmation`                        tinyint(1) DEFAULT NULL,
        `WorkCenter`                                 int(16) NOT NULL,
        `EmployeeIDWhoConfirmed`                     int(20) NOT NULL,
        `ConfirmedExecutionStartDate`                date DEFAULT NULL,
        `ConfirmedExecutionStartTime`                time DEFAULT NULL,
        `ConfirmedSetupStartDate`                    date DEFAULT NULL,
        `ConfirmedSetupStartTime`                    time DEFAULT NULL,
        `ConfirmedProcessingStartDate`               date DEFAULT NULL,
        `ConfirmedProcessingStartTime`               time DEFAULT NULL,
        `ConfirmedExecutionEndDate`                  date DEFAULT NULL,
        `ConfirmedExecutionEndTime`                  time DEFAULT NULL,
        `ConfirmedSetupEndDate`                      date DEFAULT NULL,
        `ConfirmedSetupEndTime`                      time DEFAULT NULL,
        `ConfirmedProcessingEndDate`                 date DEFAULT NULL,
        `ConfirmedProcessingEndTime`                 time DEFAULT NULL,
        `ConfirmedWaitDuration`                      float(11) DEFAULT NULL,
        `WaitDurationUnit`                           varchar(3) DEFAULT NULL,
        `ConfirmedQueueDuration`                     float(11) DEFAULT NULL,
        `QueueDurationUnit`                          varchar(3) DEFAULT NULL,
        `ConfirmedMoveDuration`                      float(11) DEFAULT NULL,
        `MoveDurationUnit`                           varchar(3) DEFAULT NULL,
        `ConfirmedYieldQuantity`                     float(15) DEFAULT NULL,
        `ConfirmedScrapQuantity`                     float(15) DEFAULT NULL,
        `OperationVarianceReason`                    varchar(200) DEFAULT NULL,
		`CreationDate`                               date NOT NULL,
		`CreationTime`                               time NOT NULL,
		`LastChangeDate`                             date NOT NULL,
		`LastChangeTime`                             time NOT NULL,
    	`IsCancelled`                                tinyint(1) DEFAULT NULL,

    PRIMARY KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`, `ConfirmationCountingID`),
	
    CONSTRAINT `DPFMProductionOrderConfHeaderData_fk` FOREIGN KEY (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`) REFERENCES `data_platform_production_order_item_operation_data` (`ProductionOrder`, `ProductionOrderItem`, `Operations`, `OperationsItem`, `OperationID`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataProductBaseUnit_fk` FOREIGN KEY (`ProductBaseUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataProductProductionUnit_fk` FOREIGN KEY (`ProductProductionUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataProductOperationUnit_fk` FOREIGN KEY (`ProductOperationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataWorkCenter_fk` FOREIGN KEY (`WorkCenter`) REFERENCES `data_platform_work_center_general_data` (`WorkCenter`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataWaitDurationUnit_fk` FOREIGN KEY (`WaitDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataQueueDurationUnit_fk` FOREIGN KEY (`QueueDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),
    CONSTRAINT `DPFMProductionOrderConfHeaderDataMoveDurationUnit_fk` FOREIGN KEY (`MoveDurationUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
