-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: golarsdev
-- Source Schemata: golarsdev
-- Created: Sun Aug 19 23:59:02 2018
-- Workbench Version: 8.0.12
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema golarsdev
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `golarsdev` ;
CREATE SCHEMA IF NOT EXISTS `golarsdev` ;

-- ----------------------------------------------------------------------------
-- Table golarsdev.AcceptedEventRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AcceptedEventRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `EventId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `RespondedDate` DATETIME NULL DEFAULT NULL,
  `Response` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Account
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Account` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `MasterRecordId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `BillingStreet` LONGTEXT NULL DEFAULT NULL,
  `BillingCity` LONGTEXT NULL DEFAULT NULL,
  `BillingState` LONGTEXT NULL DEFAULT NULL,
  `BillingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `BillingCountry` LONGTEXT NULL DEFAULT NULL,
  `BillingLatitude` DOUBLE NULL DEFAULT NULL,
  `BillingLongitude` DOUBLE NULL DEFAULT NULL,
  `BillingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `BillingAddress` LONGTEXT NULL DEFAULT NULL,
  `ShippingStreet` LONGTEXT NULL DEFAULT NULL,
  `ShippingCity` LONGTEXT NULL DEFAULT NULL,
  `ShippingState` LONGTEXT NULL DEFAULT NULL,
  `ShippingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `ShippingCountry` LONGTEXT NULL DEFAULT NULL,
  `ShippingLatitude` DOUBLE NULL DEFAULT NULL,
  `ShippingLongitude` DOUBLE NULL DEFAULT NULL,
  `ShippingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `ShippingAddress` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `AccountNumber` LONGTEXT NULL DEFAULT NULL,
  `Website` LONGTEXT NULL DEFAULT NULL,
  `PhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `Sic` LONGTEXT NULL DEFAULT NULL,
  `Industry` LONGTEXT NULL DEFAULT NULL,
  `AnnualRevenue` LONGTEXT NULL DEFAULT NULL,
  `NumberOfEmployees` INT NULL DEFAULT NULL,
  `Ownership` LONGTEXT NULL DEFAULT NULL,
  `TickerSymbol` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Rating` LONGTEXT NULL DEFAULT NULL,
  `Site` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Jigsaw` LONGTEXT NULL DEFAULT NULL,
  `JigsawCompanyId` LONGTEXT NULL DEFAULT NULL,
  `AccountSource` LONGTEXT NULL DEFAULT NULL,
  `SicDesc` LONGTEXT NULL DEFAULT NULL,
  `Is_Active__c` BOOLEAN NULL DEFAULT NULL,
  `Do_not_Pursue__c` BOOLEAN NULL DEFAULT NULL,
  `Do_Not_Pursue_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Remediation_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Title__c` LONGTEXT NULL DEFAULT NULL,
  `Account_Holders_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Amount__c` LONGTEXT NULL DEFAULT NULL,
  `Authorized_By__c` LONGTEXT NULL DEFAULT NULL,
  `Bank_Account_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Bank_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Bank_Routing_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Enable_Payment__c` BOOLEAN NULL DEFAULT NULL,
  `Frequency__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Project_Manager__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Inspector__c` LONGTEXT NULL DEFAULT NULL,
  `Test_Vendor__c` LONGTEXT NULL DEFAULT NULL,
  `TestVendor_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Address__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `ELTF_Application_Due_Date__c` DATE NULL DEFAULT NULL,
  `SOS_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Tax_ID_Information__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Number__c` LONGTEXT NULL DEFAULT NULL,
  `TANK_CAPACITY__c` DOUBLE NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_SUBSTANCE_DESCRIPTION__c` LONGTEXT NULL DEFAULT NULL,
  `Scope_Of_Work__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Status__c` LONGTEXT NULL DEFAULT NULL,
  `MGT_Paid_Service__c` BOOLEAN NULL DEFAULT NULL,
  `ELTF_Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Last_Update__c` DATE NULL DEFAULT NULL,
  `LUST_Last_Update__c` DATE NULL DEFAULT NULL,
  `UST_Last_Update__c` DATE NULL DEFAULT NULL,
  `LON_or_COI_Expiry_Date__c` DATE NULL DEFAULT NULL,
  `CLOSURE_DATE__c` DATE NULL DEFAULT NULL,
  `Year_of_Tank_Installation__c` DATE NULL DEFAULT NULL,
  `ELTF_Submitted_Date__c` DATE NULL DEFAULT NULL,
  `ELTF_Approved_Date__c` DATE NULL DEFAULT NULL,
  `COFA_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Id__c` LONGTEXT NULL DEFAULT NULL,
  `USSBOA_Project__c` LONGTEXT NULL DEFAULT NULL,
  `USSBOA_Paid_Service__c` BOOLEAN NULL DEFAULT NULL,
  `Client_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Consultant__c` LONGTEXT NULL DEFAULT NULL,
  `Country__c` LONGTEXT NULL DEFAULT NULL,
  `County__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Percent__c` DOUBLE NULL DEFAULT NULL,
  `Effective_Date_of_Ownership__c` DATE NULL DEFAULT NULL,
  `Email__c` LONGTEXT NULL DEFAULT NULL,
  `Existing_Client__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Owner_POA__c` BOOLEAN NULL DEFAULT NULL,
  `Federal_ID__c` LONGTEXT NULL DEFAULT NULL,
  `GOLARS_End_Date__c` DATE NULL DEFAULT NULL,
  `GOLARS_Project__c` LONGTEXT NULL DEFAULT NULL,
  `GOLARS_Start_Date__c` DATE NULL DEFAULT NULL,
  `GOLARS__c` BOOLEAN NULL DEFAULT NULL,
  `Incident_Number__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Incident_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Last_Site_Closure_Date__c` DATE NULL DEFAULT NULL,
  `MGT_Company__c` BOOLEAN NULL DEFAULT NULL,
  `MGT_End_Date__c` DATE NULL DEFAULT NULL,
  `MGT_Project__c` LONGTEXT NULL DEFAULT NULL,
  `MGT_Start_Date__c` DATE NULL DEFAULT NULL,
  `MGT__c` BOOLEAN NULL DEFAULT NULL,
  `Mobile__c` LONGTEXT NULL DEFAULT NULL,
  `Notification_form_Approved__c` DATE NULL DEFAULT NULL,
  `Notification_form_Submitted__c` DATE NULL DEFAULT NULL,
  `Operator_Company_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Operator_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Program_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Card_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Owner_Company_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `Remidiation_System__c` BOOLEAN NULL DEFAULT NULL,
  `SOS_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Site_Contaminated__c` BOOLEAN NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `Status_of_Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Street__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Tax_ID__c` LONGTEXT NULL DEFAULT NULL,
  `USSBOA_End_Date__c` DATE NULL DEFAULT NULL,
  `USSBOA_Start_Date__c` DATE NULL DEFAULT NULL,
  `USSBOA__c` BOOLEAN NULL DEFAULT NULL,
  `UST_Owner_Company_Name__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `VFC_Document_Date__c` DATE NULL DEFAULT NULL,
  `VFC_Document_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Zip__c` LONGTEXT NULL DEFAULT NULL,
  `of_ELTF_Claims__c` DOUBLE NULL DEFAULT NULL,
  `Company_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `No_Of_tanks__c` DOUBLE NULL DEFAULT NULL,
  `Environmental_Consultant__c` LONGTEXT NULL DEFAULT NULL,
  `Payment_Received__c` BOOLEAN NULL DEFAULT NULL,
  `Is_tank_information_available__c` BOOLEAN NULL DEFAULT NULL,
  `Project_Manager__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Operator_POA__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Owner_POA__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Owner_POA__c` LONGTEXT NULL DEFAULT NULL,
  `Operator_Affidevit_of_Lease__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Affidavit_Of_Lease__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Deed_Land_Contract__c` LONGTEXT NULL DEFAULT NULL,
  `Letter_of_Networth_Certificate_of_INsure__c` LONGTEXT NULL DEFAULT NULL,
  `Due_Date__c` DATE NULL DEFAULT NULL,
  `Release_Detection_Report__c` DATE NULL DEFAULT NULL,
  `Line_and_Leak_Detector_Test__c` DATE NULL DEFAULT NULL,
  `Operator_B_certificate__c` DATE NULL DEFAULT NULL,
  `Operator_A_certificate__c` DATE NULL DEFAULT NULL,
  `Operator_C_certificate__c` DATE NULL DEFAULT NULL,
  `Notification_Form__c` DATE NULL DEFAULT NULL,
  `Tank_Testing_Report__c` DATE NULL DEFAULT NULL,
  `Cathodic_Protection__c` DATE NULL DEFAULT NULL,
  `Cathodic_protection_E__c` DATE NULL DEFAULT NULL,
  `Internal_Lining_Inspection__c` DATE NULL DEFAULT NULL,
  `Repair_Documents__c` DATE NULL DEFAULT NULL,
  `Financial_Responsibility__c` DATE NULL DEFAULT NULL,
  `Store_Manager__c` LONGTEXT NULL DEFAULT NULL,
  `MGT_Paid_Service_Expiry__c` DATE NULL DEFAULT NULL,
  `CreatedBy__c` LONGTEXT NULL DEFAULT NULL,
  `Are_Repair_Documents_Required__c` BOOLEAN NULL DEFAULT NULL,
  `Is_Release_Detection_Report_Required__c` BOOLEAN NULL DEFAULT NULL,
  `GT_Reimbursement__c` DOUBLE NULL DEFAULT NULL,
  `LLD_Test_Reimbursement__c` DOUBLE NULL DEFAULT NULL,
  `Site_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Fee_Reimbursement__c` DOUBLE NULL DEFAULT NULL,
  `Region__c` DOUBLE NULL DEFAULT NULL,
  `USSBOA_Client_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Golars_Tank_Project_Manager__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Tank_Testing_Report_Required__c` BOOLEAN NULL DEFAULT NULL,
  `GT_interested_date__c` DATE NULL DEFAULT NULL,
  `Do_not_Trigger_emails__c` BOOLEAN NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL,
  `Water_Dichloroethene_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Water_Tetrachloroethene_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Water_Trichloroethene_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Water_Vinyl_Chloride_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Is_CP_IL_required__c` BOOLEAN NULL DEFAULT NULL,
  `Is_CP_required__c` BOOLEAN NULL DEFAULT NULL,
  `Is_LnL_Detr_Tst_requrd__c` BOOLEAN NULL DEFAULT NULL,
  `Internal_Lining_Report__c` DATE NULL DEFAULT NULL,
  `Is_IL_Inspection_Required__c` BOOLEAN NULL DEFAULT NULL,
  `Operating_Areas__c` LONGTEXT NULL DEFAULT NULL,
  `Acquisition_Date__c` DATE NULL DEFAULT NULL,
  `Sold_Date__c` DATE NULL DEFAULT NULL,
  `Insurance_Company__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Owner_at_Time_of_Release__c` LONGTEXT NULL DEFAULT NULL,
  `IDEM_Deadline__c` DATE NULL DEFAULT NULL,
  `Operator_Lease_Agreement__c` LONGTEXT NULL DEFAULT NULL,
  `Sales_Lead__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AccountContactRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AccountContactRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AccountFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AccountFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AccountHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AccountHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AccountPartner
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AccountPartner` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AccountFromId` LONGTEXT NULL DEFAULT NULL,
  `AccountToId` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ReversePartnerId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AccountShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AccountShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccountAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `OpportunityAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `CaseAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `ContactAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ActionLinkGroupTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ActionLinkGroupTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ExecutionsAllowed` LONGTEXT NULL DEFAULT NULL,
  `HoursUntilExpiration` INT NULL DEFAULT NULL,
  `Category` LONGTEXT NULL DEFAULT NULL,
  `IsPublished` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ActionLinkTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ActionLinkTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ActionLinkGroupTemplateId` LONGTEXT NULL DEFAULT NULL,
  `LabelKey` LONGTEXT NULL DEFAULT NULL,
  `Method` LONGTEXT NULL DEFAULT NULL,
  `LinkType` LONGTEXT NULL DEFAULT NULL,
  `Position` INT NULL DEFAULT NULL,
  `IsConfirmationRequired` BOOLEAN NULL DEFAULT NULL,
  `IsGroupDefault` BOOLEAN NULL DEFAULT NULL,
  `UserVisibility` LONGTEXT NULL DEFAULT NULL,
  `UserAlias` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `ActionUrl` LONGTEXT NULL DEFAULT NULL,
  `RequestBody` LONGTEXT NULL DEFAULT NULL,
  `Headers` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AdditionalNumber
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AdditionalNumber` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CallCenterId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Affiliate_Company__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Affiliate_Company__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Company_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Company_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Existing_Client__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Announcement
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Announcement` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `FeedItemId` LONGTEXT NULL DEFAULT NULL,
  `ExpirationDate` DATETIME NULL DEFAULT NULL,
  `SendEmails` BOOLEAN NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexClass
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexClass` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `IsValid` BOOLEAN NULL DEFAULT NULL,
  `BodyCrc` DOUBLE NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LengthWithoutComments` INT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexComponent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexComponent` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `ControllerType` LONGTEXT NULL DEFAULT NULL,
  `ControllerKey` LONGTEXT NULL DEFAULT NULL,
  `Markup` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexEmailNotification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexEmailNotification` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexLog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexLog` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `LogUserId` LONGTEXT NULL DEFAULT NULL,
  `LogLength` INT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `Request` LONGTEXT NULL DEFAULT NULL,
  `Operation` LONGTEXT NULL DEFAULT NULL,
  `Application` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `DurationMilliseconds` INT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `StartTime` DATETIME NULL DEFAULT NULL,
  `Location` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexPage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexPage` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `ControllerType` LONGTEXT NULL DEFAULT NULL,
  `ControllerKey` LONGTEXT NULL DEFAULT NULL,
  `IsAvailableInTouch` BOOLEAN NULL DEFAULT NULL,
  `IsConfirmationTokenRequired` BOOLEAN NULL DEFAULT NULL,
  `Markup` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexPageInfo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexPageInfo` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `ApexPageId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `NameSpacePrefix` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsAvailableInTouch` BOOLEAN NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTestQueueItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTestQueueItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApexClassId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `ExtendedStatus` LONGTEXT NULL DEFAULT NULL,
  `ParentJobId` LONGTEXT NULL DEFAULT NULL,
  `TestRunResultId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTestResult
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTestResult` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `TestTimestamp` DATETIME NULL DEFAULT NULL,
  `Outcome` LONGTEXT NULL DEFAULT NULL,
  `ApexClassId` LONGTEXT NULL DEFAULT NULL,
  `MethodName` LONGTEXT NULL DEFAULT NULL,
  `Message` LONGTEXT NULL DEFAULT NULL,
  `StackTrace` LONGTEXT NULL DEFAULT NULL,
  `AsyncApexJobId` LONGTEXT NULL DEFAULT NULL,
  `QueueItemId` LONGTEXT NULL DEFAULT NULL,
  `ApexLogId` LONGTEXT NULL DEFAULT NULL,
  `ApexTestRunResultId` LONGTEXT NULL DEFAULT NULL,
  `RunTime` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTestResultLimits
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTestResultLimits` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApexTestResultId` LONGTEXT NULL DEFAULT NULL,
  `Soql` INT NULL DEFAULT NULL,
  `QueryRows` INT NULL DEFAULT NULL,
  `Sosl` INT NULL DEFAULT NULL,
  `Dml` INT NULL DEFAULT NULL,
  `DmlRows` INT NULL DEFAULT NULL,
  `Cpu` INT NULL DEFAULT NULL,
  `Callouts` INT NULL DEFAULT NULL,
  `Email` INT NULL DEFAULT NULL,
  `AsyncCalls` INT NULL DEFAULT NULL,
  `MobilePush` INT NULL DEFAULT NULL,
  `LimitContext` LONGTEXT NULL DEFAULT NULL,
  `LimitExceptions` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTestRunResult
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTestRunResult` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `AsyncApexJobId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `JobName` LONGTEXT NULL DEFAULT NULL,
  `IsAllTests` BOOLEAN NULL DEFAULT NULL,
  `Source` LONGTEXT NULL DEFAULT NULL,
  `StartTime` DATETIME NULL DEFAULT NULL,
  `EndTime` DATETIME NULL DEFAULT NULL,
  `TestTime` INT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `ClassesEnqueued` INT NULL DEFAULT NULL,
  `ClassesCompleted` INT NULL DEFAULT NULL,
  `MethodsEnqueued` INT NULL DEFAULT NULL,
  `MethodsCompleted` INT NULL DEFAULT NULL,
  `MethodsFailed` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTestSuite
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTestSuite` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `TestSuiteName` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ApexTrigger
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ApexTrigger` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `TableEnumOrId` LONGTEXT NULL DEFAULT NULL,
  `UsageBeforeInsert` BOOLEAN NULL DEFAULT NULL,
  `UsageAfterInsert` BOOLEAN NULL DEFAULT NULL,
  `UsageBeforeUpdate` BOOLEAN NULL DEFAULT NULL,
  `UsageAfterUpdate` BOOLEAN NULL DEFAULT NULL,
  `UsageBeforeDelete` BOOLEAN NULL DEFAULT NULL,
  `UsageAfterDelete` BOOLEAN NULL DEFAULT NULL,
  `UsageIsBulk` BOOLEAN NULL DEFAULT NULL,
  `UsageAfterUndelete` BOOLEAN NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `IsValid` BOOLEAN NULL DEFAULT NULL,
  `BodyCrc` DOUBLE NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LengthWithoutComments` INT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AppMenuItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AppMenuItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `StartUrl` LONGTEXT NULL DEFAULT NULL,
  `MobileStartUrl` LONGTEXT NULL DEFAULT NULL,
  `LogoUrl` LONGTEXT NULL DEFAULT NULL,
  `IconUrl` LONGTEXT NULL DEFAULT NULL,
  `InfoUrl` LONGTEXT NULL DEFAULT NULL,
  `IsUsingAdminAuthorization` BOOLEAN NULL DEFAULT NULL,
  `MobilePlatform` LONGTEXT NULL DEFAULT NULL,
  `MobileMinOsVer` LONGTEXT NULL DEFAULT NULL,
  `MobileDeviceType` LONGTEXT NULL DEFAULT NULL,
  `IsRegisteredDeviceOnly` BOOLEAN NULL DEFAULT NULL,
  `MobileAppVer` LONGTEXT NULL DEFAULT NULL,
  `MobileAppInstalledDate` DATETIME NULL DEFAULT NULL,
  `MobileAppInstalledVersion` LONGTEXT NULL DEFAULT NULL,
  `MobileAppBinaryId` LONGTEXT NULL DEFAULT NULL,
  `MobileAppInstallUrl` LONGTEXT NULL DEFAULT NULL,
  `CanvasEnabled` BOOLEAN NULL DEFAULT NULL,
  `CanvasReferenceId` LONGTEXT NULL DEFAULT NULL,
  `CanvasUrl` LONGTEXT NULL DEFAULT NULL,
  `CanvasAccessMethod` LONGTEXT NULL DEFAULT NULL,
  `CanvasSelectedLocations` LONGTEXT NULL DEFAULT NULL,
  `CanvasOptions` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `ApplicationId` LONGTEXT NULL DEFAULT NULL,
  `UserSortOrder` INT NULL DEFAULT NULL,
  `IsVisible` BOOLEAN NULL DEFAULT NULL,
  `IsAccessible` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Approval
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Approval` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `RequestComment` LONGTEXT NULL DEFAULT NULL,
  `ApproveComment` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Asset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Asset` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `RootAssetId` LONGTEXT NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `IsCompetitorProduct` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `SerialNumber` LONGTEXT NULL DEFAULT NULL,
  `InstallDate` DATE NULL DEFAULT NULL,
  `PurchaseDate` DATE NULL DEFAULT NULL,
  `UsageEndDate` DATE NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Price` LONGTEXT NULL DEFAULT NULL,
  `Quantity` DOUBLE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssetFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssetFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssetHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssetHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `AssetId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssetShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssetShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AssetId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AssetAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssignmentRule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssignmentRule` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `Active` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssistantRecommendation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssistantRecommendation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `RecordId` LONGTEXT NULL DEFAULT NULL,
  `BaseScore` DOUBLE NULL DEFAULT NULL,
  `RecommendationType` LONGTEXT NULL DEFAULT NULL,
  `StartTime` DATETIME NULL DEFAULT NULL,
  `EndTime` DATETIME NULL DEFAULT NULL,
  `Reason` LONGTEXT NULL DEFAULT NULL,
  `ActionPrepopulationValues` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AssistantRecommendationShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AssistantRecommendationShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AsyncApexJob
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AsyncApexJob` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `JobType` LONGTEXT NULL DEFAULT NULL,
  `ApexClassId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `JobItemsProcessed` INT NULL DEFAULT NULL,
  `TotalJobItems` INT NULL DEFAULT NULL,
  `NumberOfErrors` INT NULL DEFAULT NULL,
  `CompletedDate` DATETIME NULL DEFAULT NULL,
  `MethodName` LONGTEXT NULL DEFAULT NULL,
  `ExtendedStatus` LONGTEXT NULL DEFAULT NULL,
  `ParentJobId` LONGTEXT NULL DEFAULT NULL,
  `LastProcessed` LONGTEXT NULL DEFAULT NULL,
  `LastProcessedOffset` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Attachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Attachment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `IsPrivate` BOOLEAN NULL DEFAULT NULL,
  `ContentType` LONGTEXT NULL DEFAULT NULL,
  `BodyLength` INT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuraDefinition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuraDefinition` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `AuraDefinitionBundleId` LONGTEXT NULL DEFAULT NULL,
  `DefType` LONGTEXT NULL DEFAULT NULL,
  `Format` LONGTEXT NULL DEFAULT NULL,
  `Source` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuraDefinitionBundle
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuraDefinitionBundle` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuraDefinitionBundleInfo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuraDefinitionBundleInfo` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `AuraDefinitionBundleId` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuraDefinitionInfo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuraDefinitionInfo` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `AuraDefinitionBundleInfoId` LONGTEXT NULL DEFAULT NULL,
  `AuraDefinitionId` LONGTEXT NULL DEFAULT NULL,
  `DefType` LONGTEXT NULL DEFAULT NULL,
  `Format` LONGTEXT NULL DEFAULT NULL,
  `Source` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuthConfig
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuthConfig` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Url` LONGTEXT NULL DEFAULT NULL,
  `AuthOptionsUsernamePassword` BOOLEAN NULL DEFAULT NULL,
  `AuthOptionsSaml` BOOLEAN NULL DEFAULT NULL,
  `AuthOptionsAuthProvider` BOOLEAN NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuthConfigProviders
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuthConfigProviders` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `AuthConfigId` LONGTEXT NULL DEFAULT NULL,
  `AuthProviderId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuthProvider
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuthProvider` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `ProviderType` LONGTEXT NULL DEFAULT NULL,
  `FriendlyName` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `RegistrationHandlerId` LONGTEXT NULL DEFAULT NULL,
  `ExecutionUserId` LONGTEXT NULL DEFAULT NULL,
  `ConsumerKey` LONGTEXT NULL DEFAULT NULL,
  `ConsumerSecret` LONGTEXT NULL DEFAULT NULL,
  `ErrorUrl` LONGTEXT NULL DEFAULT NULL,
  `AuthorizeUrl` LONGTEXT NULL DEFAULT NULL,
  `TokenUrl` LONGTEXT NULL DEFAULT NULL,
  `UserInfoUrl` LONGTEXT NULL DEFAULT NULL,
  `DefaultScopes` LONGTEXT NULL DEFAULT NULL,
  `IdTokenIssuer` LONGTEXT NULL DEFAULT NULL,
  `OptionsSendAccessTokenInHeader` BOOLEAN NULL DEFAULT NULL,
  `OptionsSendClientCredentialsInHeader` BOOLEAN NULL DEFAULT NULL,
  `OptionsIncludeOrgIdInId` BOOLEAN NULL DEFAULT NULL,
  `IconUrl` LONGTEXT NULL DEFAULT NULL,
  `LogoutUrl` LONGTEXT NULL DEFAULT NULL,
  `PluginId` LONGTEXT NULL DEFAULT NULL,
  `CustomMetadataTypeRecord` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.AuthSession
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`AuthSession` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UsersId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `NumSecondsValid` INT NULL DEFAULT NULL,
  `UserType` LONGTEXT NULL DEFAULT NULL,
  `SourceIp` LONGTEXT NULL DEFAULT NULL,
  `LoginType` LONGTEXT NULL DEFAULT NULL,
  `SessionType` LONGTEXT NULL DEFAULT NULL,
  `SessionSecurityLevel` LONGTEXT NULL DEFAULT NULL,
  `LogoutUrl` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `LoginHistoryId` LONGTEXT NULL DEFAULT NULL,
  `LoginGeoId` LONGTEXT NULL DEFAULT NULL,
  `IsCurrent` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.BackgroundOperation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`BackgroundOperation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SubmittedAt` DATETIME NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `ExecutionGroup` LONGTEXT NULL DEFAULT NULL,
  `SequenceGroup` LONGTEXT NULL DEFAULT NULL,
  `SequenceNumber` INT NULL DEFAULT NULL,
  `GroupLeaderId` LONGTEXT NULL DEFAULT NULL,
  `StartedAt` DATETIME NULL DEFAULT NULL,
  `FinishedAt` DATETIME NULL DEFAULT NULL,
  `WorkerUri` LONGTEXT NULL DEFAULT NULL,
  `Timeout` INT NULL DEFAULT NULL,
  `ExpiresAt` DATETIME NULL DEFAULT NULL,
  `NumFollowers` INT NULL DEFAULT NULL,
  `ProcessAfter` DATETIME NULL DEFAULT NULL,
  `ParentKey` LONGTEXT NULL DEFAULT NULL,
  `RetryLimit` INT NULL DEFAULT NULL,
  `RetryCount` INT NULL DEFAULT NULL,
  `RetryBackoff` INT NULL DEFAULT NULL,
  `Error` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.BrandTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`BrandTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.BusinessHours
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`BusinessHours` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `SundayStartTime` DATETIME NULL DEFAULT NULL,
  `SundayEndTime` DATETIME NULL DEFAULT NULL,
  `MondayStartTime` DATETIME NULL DEFAULT NULL,
  `MondayEndTime` DATETIME NULL DEFAULT NULL,
  `TuesdayStartTime` DATETIME NULL DEFAULT NULL,
  `TuesdayEndTime` DATETIME NULL DEFAULT NULL,
  `WednesdayStartTime` DATETIME NULL DEFAULT NULL,
  `WednesdayEndTime` DATETIME NULL DEFAULT NULL,
  `ThursdayStartTime` DATETIME NULL DEFAULT NULL,
  `ThursdayEndTime` DATETIME NULL DEFAULT NULL,
  `FridayStartTime` DATETIME NULL DEFAULT NULL,
  `FridayEndTime` DATETIME NULL DEFAULT NULL,
  `SaturdayStartTime` DATETIME NULL DEFAULT NULL,
  `SaturdayEndTime` DATETIME NULL DEFAULT NULL,
  `TimeZoneSidKey` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.BusinessProcess
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`BusinessProcess` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `TableEnumOrId` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CSLDTestResult__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CSLDTestResult__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `RunDate__c` DATETIME NULL DEFAULT NULL,
  `Tank__c` LONGTEXT NULL DEFAULT NULL,
  `TankType__c` LONGTEXT NULL DEFAULT NULL,
  `OccuredAt__c` LONGTEXT NULL DEFAULT NULL,
  `Result__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CallCenter
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CallCenter` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `InternalName` LONGTEXT NULL DEFAULT NULL,
  `Version` DOUBLE NULL DEFAULT NULL,
  `AdapterUrl` LONGTEXT NULL DEFAULT NULL,
  `CustomSettings` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Campaign
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Campaign` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `ExpectedRevenue` LONGTEXT NULL DEFAULT NULL,
  `BudgetedCost` LONGTEXT NULL DEFAULT NULL,
  `ActualCost` LONGTEXT NULL DEFAULT NULL,
  `ExpectedResponse` DOUBLE NULL DEFAULT NULL,
  `NumberSent` DOUBLE NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `NumberOfLeads` INT NULL DEFAULT NULL,
  `NumberOfConvertedLeads` INT NULL DEFAULT NULL,
  `NumberOfContacts` INT NULL DEFAULT NULL,
  `NumberOfResponses` INT NULL DEFAULT NULL,
  `NumberOfOpportunities` INT NULL DEFAULT NULL,
  `NumberOfWonOpportunities` INT NULL DEFAULT NULL,
  `AmountAllOpportunities` LONGTEXT NULL DEFAULT NULL,
  `AmountWonOpportunities` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `CampaignMemberRecordTypeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CampaignFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CampaignFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CampaignHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CampaignHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CampaignId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CampaignMember
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CampaignMember` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CampaignId` LONGTEXT NULL DEFAULT NULL,
  `LeadId` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `HasResponded` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `FirstRespondedDate` DATE NULL DEFAULT NULL,
  `Salutation` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `FirstName` LONGTEXT NULL DEFAULT NULL,
  `LastName` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Street` LONGTEXT NULL DEFAULT NULL,
  `City` LONGTEXT NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `PostalCode` LONGTEXT NULL DEFAULT NULL,
  `Country` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `MobilePhone` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `DoNotCall` BOOLEAN NULL DEFAULT NULL,
  `HasOptedOutOfEmail` BOOLEAN NULL DEFAULT NULL,
  `HasOptedOutOfFax` BOOLEAN NULL DEFAULT NULL,
  `LeadSource` LONGTEXT NULL DEFAULT NULL,
  `CompanyOrAccount` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `LeadOrContactId` LONGTEXT NULL DEFAULT NULL,
  `LeadOrContactOwnerId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CampaignMemberStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CampaignMemberStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CampaignId` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `HasResponded` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CampaignShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CampaignShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CampaignId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `CampaignAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Case
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Case` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CaseNumber` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `SuppliedName` LONGTEXT NULL DEFAULT NULL,
  `SuppliedEmail` LONGTEXT NULL DEFAULT NULL,
  `SuppliedPhone` LONGTEXT NULL DEFAULT NULL,
  `SuppliedCompany` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Reason` LONGTEXT NULL DEFAULT NULL,
  `Origin` LONGTEXT NULL DEFAULT NULL,
  `Subject` LONGTEXT NULL DEFAULT NULL,
  `Priority` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `ClosedDate` DATETIME NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ContactPhone` LONGTEXT NULL DEFAULT NULL,
  `ContactMobile` LONGTEXT NULL DEFAULT NULL,
  `ContactEmail` LONGTEXT NULL DEFAULT NULL,
  `ContactFax` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Golars_Contact__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseComment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseComment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `IsPublished` BOOLEAN NULL DEFAULT NULL,
  `CommentBody` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseContactRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseContactRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CasesId` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CaseId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CaseId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `CaseAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseSolution
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseSolution` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CaseId` LONGTEXT NULL DEFAULT NULL,
  `SolutionId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseTeamMember
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseTeamMember` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `MemberId` LONGTEXT NULL DEFAULT NULL,
  `TeamTemplateMemberId` LONGTEXT NULL DEFAULT NULL,
  `TeamRoleId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseTeamRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseTeamRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `PreferencesVisibleInCSP` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseTeamTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseTeamTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseTeamTemplateMember
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseTeamTemplateMember` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `TeamTemplateId` LONGTEXT NULL DEFAULT NULL,
  `MemberId` LONGTEXT NULL DEFAULT NULL,
  `TeamRoleId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CaseTeamTemplateRecord
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CaseTeamTemplateRecord` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `TeamTemplateId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CategoryData
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CategoryData` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CategoryNodeId` LONGTEXT NULL DEFAULT NULL,
  `RelatedSobjectId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CategoryNode
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CategoryNode` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `SortStyle` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentBase__Chargent_Settings__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentBase__Chargent_Settings__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `SetupOwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ChargentBase__Accept_eCheck__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Account_Updater_Confirmation_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Account_Updater_Error_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Account_Updater_Expiration_Hours__c` DOUBLE NULL DEFAULT NULL,
  `ChargentBase__Automatically_Create_PR__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Chargent_Activation_Key__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Chargent_Admin_Email_Address__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Copy_Billing_Address_from_Account__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Default_Currency__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Error_Page__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__MC_Auth_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Opportunity_Search_Criteria__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Payment_Confirmation_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Payment_Error_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Payment_Link_Expiration_Hours__c` DOUBLE NULL DEFAULT NULL,
  `ChargentBase__Payment_Request_Confirmation_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__SFDC_Sites_Page__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Show_Debug__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Thank_You_Page__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Use_RealEx_Rebate_Method__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Use_Simple_Account_Updater_Feature__c` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentBase__Custom_Gateway__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentBase__Custom_Gateway__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `SetupOwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ChargentBase__Class_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Namespace_Prefix__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentBase__Gateway__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentBase__Gateway__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentBase__Gateway__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentBase__Gateway__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `ChargentBase__AVS_Forced_Failure__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Accounting_Seed_Integration__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Active__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Allow_Unlinked_Refund__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Available_Card_Types__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Available_Currencies__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Available_PR_Transaction_Types__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Available_Payment_Methods__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Charge_Amount_Behavior__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Clear_CCV2_Code__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Credit_Card_Data_Handling__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Currency__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Debug__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Endpoint_Override__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Inherit_Chargent_Currency__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Merchant_ID__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Merchant_Reference__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__ModusLink_Test_Mode__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Orbital_Platform__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Require_AVS__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Require_CCV__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Require_CVV__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Security_Key__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Show_Authorize_Button__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Show_Charge_Button__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Show_Create_Update_Token_Button__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Static_Charge_Amount__c` DOUBLE NULL DEFAULT NULL,
  `ChargentBase__Test_Mode__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Transaction_Security_Key__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Use_Reference_Transactions__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Use_Tokenization__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentBase__Username__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Verification_Forced_Failures__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Web_Pay_Status_Merchant_Id__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Web_Pay_Status_Merchant_password__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Web_Payment_Status_Endpoint__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentBase__Duplicate_Transaction_Window__c` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Account_Updater_Log__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Account_Updater_Log__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Billing_Email__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__ChargentOrder__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Date_Sent__c` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Log_Message__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Order_With_Error__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Status__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__ChargentOrder__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__ChargentOrder__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__ChargentOrder__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__ChargentOrder__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Account__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Balance_Due__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Routing_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Address_Line_2__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Address__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_City__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Company__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Country__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Email__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Fax__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_First_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Last_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Phone__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_State_Province__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_State__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Zip_Postal__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Birthdate__c` DATE NULL DEFAULT NULL,
  `ChargentOrders__CPF_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Expiration_Month__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Expiration_Year__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Last_4__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Month_Indicator__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Security_Code__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Year_Indicator__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Charge_Amount__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Charge_Date__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Check_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Credit_Amount__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Credit_Card_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Currency__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Customer_IP__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Customer_Token__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Date__c` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Date_of_Birth__c` DATE NULL DEFAULT NULL,
  `ChargentOrders__Description__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Gateway_Card_Handling__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Gateway__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Invoice_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Manual_Charge__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__Mercury_ID__c` DOUBLE NULL DEFAULT NULL,
  `ChargentOrders__Next_Transaction_Date__c` DATE NULL DEFAULT NULL,
  `ChargentOrders__No_Tax__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__OrderNumber__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__OrderSource__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Order_Information__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Order_Link__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Order_Note__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__PO_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Count__c` DOUBLE NULL DEFAULT NULL,
  `ChargentOrders__Payment_End_Date__c` DATE NULL DEFAULT NULL,
  `ChargentOrders__Payment_Frequency__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Method__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Received__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Start_Date__c` DATE NULL DEFAULT NULL,
  `ChargentOrders__Payment_Status__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Stop__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Address_Line_2__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Address__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_City__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Company__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Country__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Duty__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_First_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Instructions__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Phone__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_State__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping_Zip_Postal__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Shipping__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Status__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Subtotal__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Tax_Exempt__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__Tax__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Tokenization__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Total__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Tracking_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Update_Token__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__UseTokenization__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Last_Transaction__c` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Transaction_Count_Recurring__c` DOUBLE NULL DEFAULT NULL,
  `ChargentOrders__Transaction_Count__c` DOUBLE NULL DEFAULT NULL,
  `ChargentOrders__Transaction_Total__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Account_Name__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Custom_Gateway_Mapping__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Custom_Gateway_Mapping__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `SetupOwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Value__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Email_Notification__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Email_Notification__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `ChargentOrders__Account_Updater_Link_Formatted__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Account_Updater_Link__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__ChargentOrder__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Email__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__First_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Last_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Notification_Message__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Status__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Payment_Request__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Payment_Request__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__ChargentOrder__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Email_Address__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Hash_Sum__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Include_Parent_ID__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__Notes__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Pay_Link__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Link_Formatted__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Request_Transaction_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Send_Payment_Request_Email__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__Status__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Transaction__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Transaction__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChargentOrders__Transaction__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChargentOrders__Transaction__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Order__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__AVS_International__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__AVS_Response_Code__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__AVS_Zip__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Account__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Amount__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Amount_available_for_Refund__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Authorization__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Status__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Account_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Bank_Routing_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Address_Line_2__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Address__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_City__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Company__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Country__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Email__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Fax__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_First__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Last__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Phone__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Postal_Code__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_Province__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Billing_State__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Code_Response__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Card_Last_4__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Cash_Disbursement__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Cash_Receipt__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Credit_Card_Name__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Credit_Card_Number__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Credit_Card_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Currency__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Customer_Token__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Description__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Details_Payflow__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Details__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Gateway_Date__c` DATETIME NULL DEFAULT NULL,
  `ChargentOrders__Gateway_ID__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Gateway_Response__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Gateway__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Method__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Payment_Request__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Reason_Code__c` DOUBLE NULL DEFAULT NULL,
  `ChargentOrders__Reason_Text__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Recurring__c` BOOLEAN NULL DEFAULT NULL,
  `ChargentOrders__Response_Code__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Response_Message__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Response_Status__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Response__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Tokenization__c` LONGTEXT NULL DEFAULT NULL,
  `ChargentOrders__Type__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ChatterActivity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ChatterActivity` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `PostCount` INT NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `CommentReceivedCount` INT NULL DEFAULT NULL,
  `LikeReceivedCount` INT NULL DEFAULT NULL,
  `InfluenceRawRank` INT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ClientBrowser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ClientBrowser` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UsersId` LONGTEXT NULL DEFAULT NULL,
  `FullUserAgent` LONGTEXT NULL DEFAULT NULL,
  `ProxyInfo` LONGTEXT NULL DEFAULT NULL,
  `LastUpdate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CollaborationGroup
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CollaborationGroup` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `MemberCount` INT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CollaborationType` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `FullPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `MediumPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `SmallPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `LastFeedModifiedDate` DATETIME NULL DEFAULT NULL,
  `InformationTitle` LONGTEXT NULL DEFAULT NULL,
  `InformationBody` LONGTEXT NULL DEFAULT NULL,
  `HasPrivateFieldsAccess` BOOLEAN NULL DEFAULT NULL,
  `CanHaveGuests` BOOLEAN NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `IsAutoArchiveDisabled` BOOLEAN NULL DEFAULT NULL,
  `AnnouncementId` LONGTEXT NULL DEFAULT NULL,
  `GroupEmail` LONGTEXT NULL DEFAULT NULL,
  `BannerPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `IsBroadcast` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CollaborationGroupFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CollaborationGroupFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CollaborationGroupMember
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CollaborationGroupMember` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CollaborationGroupId` LONGTEXT NULL DEFAULT NULL,
  `MemberId` LONGTEXT NULL DEFAULT NULL,
  `CollaborationRole` LONGTEXT NULL DEFAULT NULL,
  `NotificationFrequency` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastFeedAccessDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CollaborationGroupMemberRequest
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CollaborationGroupMemberRequest` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CollaborationGroupId` LONGTEXT NULL DEFAULT NULL,
  `RequesterId` LONGTEXT NULL DEFAULT NULL,
  `ResponseMessage` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CollaborationInvitation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CollaborationInvitation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `SharedEntityId` LONGTEXT NULL DEFAULT NULL,
  `InviterId` LONGTEXT NULL DEFAULT NULL,
  `InvitedUserEmail` LONGTEXT NULL DEFAULT NULL,
  `InvitedUserEmailNormalized` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `OptionalMessage` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Community
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Community` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `IsPublished` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ConnectedApplication
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ConnectedApplication` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `OptionsAllowAdminApprovedUsersOnly` BOOLEAN NULL DEFAULT NULL,
  `OptionsRefreshTokenValidityMetric` BOOLEAN NULL DEFAULT NULL,
  `OptionsHasSessionLevelPolicy` BOOLEAN NULL DEFAULT NULL,
  `OptionsIsInternal` BOOLEAN NULL DEFAULT NULL,
  `MobileSessionTimeout` LONGTEXT NULL DEFAULT NULL,
  `PinLength` LONGTEXT NULL DEFAULT NULL,
  `StartUrl` LONGTEXT NULL DEFAULT NULL,
  `MobileStartUrl` LONGTEXT NULL DEFAULT NULL,
  `RefreshTokenValidityPeriod` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Contact
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Contact` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `MasterRecordId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `LastName` LONGTEXT NULL DEFAULT NULL,
  `FirstName` LONGTEXT NULL DEFAULT NULL,
  `Salutation` LONGTEXT NULL DEFAULT NULL,
  `MiddleName` LONGTEXT NULL DEFAULT NULL,
  `Suffix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `OtherStreet` LONGTEXT NULL DEFAULT NULL,
  `OtherCity` LONGTEXT NULL DEFAULT NULL,
  `OtherState` LONGTEXT NULL DEFAULT NULL,
  `OtherPostalCode` LONGTEXT NULL DEFAULT NULL,
  `OtherCountry` LONGTEXT NULL DEFAULT NULL,
  `OtherLatitude` DOUBLE NULL DEFAULT NULL,
  `OtherLongitude` DOUBLE NULL DEFAULT NULL,
  `OtherGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `OtherAddress` LONGTEXT NULL DEFAULT NULL,
  `MailingStreet` LONGTEXT NULL DEFAULT NULL,
  `MailingCity` LONGTEXT NULL DEFAULT NULL,
  `MailingState` LONGTEXT NULL DEFAULT NULL,
  `MailingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `MailingCountry` LONGTEXT NULL DEFAULT NULL,
  `MailingLatitude` DOUBLE NULL DEFAULT NULL,
  `MailingLongitude` DOUBLE NULL DEFAULT NULL,
  `MailingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `MailingAddress` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `MobilePhone` LONGTEXT NULL DEFAULT NULL,
  `HomePhone` LONGTEXT NULL DEFAULT NULL,
  `OtherPhone` LONGTEXT NULL DEFAULT NULL,
  `AssistantPhone` LONGTEXT NULL DEFAULT NULL,
  `ReportsToId` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Department` LONGTEXT NULL DEFAULT NULL,
  `AssistantName` LONGTEXT NULL DEFAULT NULL,
  `LeadSource` LONGTEXT NULL DEFAULT NULL,
  `Birthdate` DATE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `HasOptedOutOfEmail` BOOLEAN NULL DEFAULT NULL,
  `HasOptedOutOfFax` BOOLEAN NULL DEFAULT NULL,
  `DoNotCall` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastCURequestDate` DATETIME NULL DEFAULT NULL,
  `LastCUUpdateDate` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `EmailBouncedReason` LONGTEXT NULL DEFAULT NULL,
  `EmailBouncedDate` DATETIME NULL DEFAULT NULL,
  `IsEmailBounced` BOOLEAN NULL DEFAULT NULL,
  `PhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `Jigsaw` LONGTEXT NULL DEFAULT NULL,
  `JigsawContactId` LONGTEXT NULL DEFAULT NULL,
  `Fund_Raising__c` BOOLEAN NULL DEFAULT NULL,
  `Indian_Community__c` BOOLEAN NULL DEFAULT NULL,
  `Address__c` LONGTEXT NULL DEFAULT NULL,
  `Company_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Email__c` LONGTEXT NULL DEFAULT NULL,
  `Existing_Client__c` LONGTEXT NULL DEFAULT NULL,
  `Federal_ID__c` LONGTEXT NULL DEFAULT NULL,
  `GOLARS_End_Date__c` DATE NULL DEFAULT NULL,
  `GOLARS_Start_Date__c` DATE NULL DEFAULT NULL,
  `GOLARS__c` BOOLEAN NULL DEFAULT NULL,
  `MGT_End_Date__c` DATE NULL DEFAULT NULL,
  `MGT_Start_Date__c` DATE NULL DEFAULT NULL,
  `MGT__c` BOOLEAN NULL DEFAULT NULL,
  `Name__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Address__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Phone__c` DOUBLE NULL DEFAULT NULL,
  `Profession__c` LONGTEXT NULL DEFAULT NULL,
  `SOS_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Tax_ID__c` LONGTEXT NULL DEFAULT NULL,
  `USSBOA_End_Date__c` DATE NULL DEFAULT NULL,
  `USSBOA_Start_Date__c` DATE NULL DEFAULT NULL,
  `USSBOA__c` BOOLEAN NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Preferred_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Temple__c` BOOLEAN NULL DEFAULT NULL,
  `Business_Opportunity__c` BOOLEAN NULL DEFAULT NULL,
  `Test_Vendor_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Charity__c` BOOLEAN NULL DEFAULT NULL,
  `HNI__c` BOOLEAN NULL DEFAULT NULL,
  `Member_ID__c` LONGTEXT NULL DEFAULT NULL,
  `WatsApp__c` BOOLEAN NULL DEFAULT NULL,
  `American_Other__c` BOOLEAN NULL DEFAULT NULL,
  `Passcode__c` LONGTEXT NULL DEFAULT NULL,
  `Company__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Conversion__c` BOOLEAN NULL DEFAULT NULL,
  `Related_Client_Information__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContactFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContactFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContactHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContactHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContactShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContactShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `ContactAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentAsset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentAsset` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ContentDocumentId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentDistribution
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentDistribution` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContentVersionId` LONGTEXT NULL DEFAULT NULL,
  `ContentDocumentId` LONGTEXT NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `PreferencesAllowPDFDownload` BOOLEAN NULL DEFAULT NULL,
  `PreferencesAllowOriginalDownload` BOOLEAN NULL DEFAULT NULL,
  `PreferencesPasswordRequired` BOOLEAN NULL DEFAULT NULL,
  `PreferencesNotifyOnVisit` BOOLEAN NULL DEFAULT NULL,
  `PreferencesLinkLatestVersion` BOOLEAN NULL DEFAULT NULL,
  `PreferencesAllowViewInBrowser` BOOLEAN NULL DEFAULT NULL,
  `PreferencesExpires` BOOLEAN NULL DEFAULT NULL,
  `PreferencesNotifyRndtnComplete` BOOLEAN NULL DEFAULT NULL,
  `ExpiryDate` DATETIME NULL DEFAULT NULL,
  `Password` LONGTEXT NULL DEFAULT NULL,
  `ViewCount` INT NULL DEFAULT NULL,
  `FirstViewDate` DATETIME NULL DEFAULT NULL,
  `LastViewDate` DATETIME NULL DEFAULT NULL,
  `DistributionPublicUrl` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentDistributionView
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentDistributionView` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DistributionId` LONGTEXT NULL DEFAULT NULL,
  `ParentViewId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `IsInternal` BOOLEAN NULL DEFAULT NULL,
  `IsDownload` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentDocument
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentDocument` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `ArchivedById` LONGTEXT NULL DEFAULT NULL,
  `ArchivedDate` DATE NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `PublishStatus` LONGTEXT NULL DEFAULT NULL,
  `LatestPublishedVersionId` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `ContentSize` INT NULL DEFAULT NULL,
  `FileType` LONGTEXT NULL DEFAULT NULL,
  `FileExtension` LONGTEXT NULL DEFAULT NULL,
  `SharingOption` LONGTEXT NULL DEFAULT NULL,
  `ContentModifiedDate` DATETIME NULL DEFAULT NULL,
  `ContentAssetId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentDocumentFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentDocumentFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentDocumentHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentDocumentHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContentDocumentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentFolder
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentFolder` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ParentContentFolderId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentFolderLink
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentFolderLink` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentEntityId` LONGTEXT NULL DEFAULT NULL,
  `ContentFolderId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `EnableFolderStatus` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentNote
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentNote` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `FileType` LONGTEXT NULL DEFAULT NULL,
  `TextPreview` LONGTEXT NULL DEFAULT NULL,
  `ContentSize` INT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `FileExtension` LONGTEXT NULL DEFAULT NULL,
  `LatestPublishedVersionId` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `Content` LONGTEXT NULL DEFAULT NULL,
  `IsReadOnly` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentVersion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentVersion` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ContentDocumentId` LONGTEXT NULL DEFAULT NULL,
  `IsLatest` BOOLEAN NULL DEFAULT NULL,
  `ContentUrl` LONGTEXT NULL DEFAULT NULL,
  `VersionNumber` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `ReasonForChange` LONGTEXT NULL DEFAULT NULL,
  `SharingOption` LONGTEXT NULL DEFAULT NULL,
  `PathOnClient` LONGTEXT NULL DEFAULT NULL,
  `RatingCount` INT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContentModifiedDate` DATETIME NULL DEFAULT NULL,
  `ContentModifiedById` LONGTEXT NULL DEFAULT NULL,
  `PositiveRatingCount` INT NULL DEFAULT NULL,
  `NegativeRatingCount` INT NULL DEFAULT NULL,
  `FeaturedContentBoost` INT NULL DEFAULT NULL,
  `FeaturedContentDate` DATE NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `TagCsv` LONGTEXT NULL DEFAULT NULL,
  `FileType` LONGTEXT NULL DEFAULT NULL,
  `PublishStatus` LONGTEXT NULL DEFAULT NULL,
  `VersionData` LONGTEXT NULL DEFAULT NULL,
  `ContentSize` INT NULL DEFAULT NULL,
  `FileExtension` LONGTEXT NULL DEFAULT NULL,
  `FirstPublishLocationId` LONGTEXT NULL DEFAULT NULL,
  `Origin` LONGTEXT NULL DEFAULT NULL,
  `ContentLocation` LONGTEXT NULL DEFAULT NULL,
  `TextPreview` LONGTEXT NULL DEFAULT NULL,
  `ExternalDocumentInfo1` LONGTEXT NULL DEFAULT NULL,
  `ExternalDocumentInfo2` LONGTEXT NULL DEFAULT NULL,
  `ExternalDataSourceId` LONGTEXT NULL DEFAULT NULL,
  `Checksum` LONGTEXT NULL DEFAULT NULL,
  `IsMajorVersion` BOOLEAN NULL DEFAULT NULL,
  `IsAssetEnabled` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentVersionHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentVersionHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContentVersionId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentWorkspace
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentWorkspace` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `TagModel` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `DefaultRecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `IsRestrictContentTypes` BOOLEAN NULL DEFAULT NULL,
  `IsRestrictLinkedContentTypes` BOOLEAN NULL DEFAULT NULL,
  `WorkspaceType` LONGTEXT NULL DEFAULT NULL,
  `LastWorkspaceActivityDate` DATETIME NULL DEFAULT NULL,
  `RootContentFolderId` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContentWorkspaceDoc
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContentWorkspaceDoc` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ContentWorkspaceId` LONGTEXT NULL DEFAULT NULL,
  `ContentDocumentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsOwner` BOOLEAN NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Contract
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Contract` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerExpirationNotice` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `BillingStreet` LONGTEXT NULL DEFAULT NULL,
  `BillingCity` LONGTEXT NULL DEFAULT NULL,
  `BillingState` LONGTEXT NULL DEFAULT NULL,
  `BillingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `BillingCountry` LONGTEXT NULL DEFAULT NULL,
  `BillingLatitude` DOUBLE NULL DEFAULT NULL,
  `BillingLongitude` DOUBLE NULL DEFAULT NULL,
  `BillingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `BillingAddress` LONGTEXT NULL DEFAULT NULL,
  `ShippingStreet` LONGTEXT NULL DEFAULT NULL,
  `ShippingCity` LONGTEXT NULL DEFAULT NULL,
  `ShippingState` LONGTEXT NULL DEFAULT NULL,
  `ShippingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `ShippingCountry` LONGTEXT NULL DEFAULT NULL,
  `ShippingLatitude` DOUBLE NULL DEFAULT NULL,
  `ShippingLongitude` DOUBLE NULL DEFAULT NULL,
  `ShippingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `ShippingAddress` LONGTEXT NULL DEFAULT NULL,
  `ContractTerm` INT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `CompanySignedId` LONGTEXT NULL DEFAULT NULL,
  `CompanySignedDate` DATE NULL DEFAULT NULL,
  `CustomerSignedId` LONGTEXT NULL DEFAULT NULL,
  `CustomerSignedTitle` LONGTEXT NULL DEFAULT NULL,
  `CustomerSignedDate` DATE NULL DEFAULT NULL,
  `SpecialTerms` LONGTEXT NULL DEFAULT NULL,
  `ActivatedById` LONGTEXT NULL DEFAULT NULL,
  `ActivatedDate` DATETIME NULL DEFAULT NULL,
  `StatusCode` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContractNumber` LONGTEXT NULL DEFAULT NULL,
  `LastApprovedDate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContractContactRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContractContactRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ContractId` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContractFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContractFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContractHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContractHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ContractId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ContractStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ContractStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `StatusCode` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CorsWhitelistEntry
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CorsWhitelistEntry` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `UrlPattern` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CronJobDetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CronJobDetail` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `JobType` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CronTrigger
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CronTrigger` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CronJobDetailId` LONGTEXT NULL DEFAULT NULL,
  `NextFireTime` DATETIME NULL DEFAULT NULL,
  `PreviousFireTime` DATETIME NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `StartTime` DATETIME NULL DEFAULT NULL,
  `EndTime` DATETIME NULL DEFAULT NULL,
  `CronExpression` LONGTEXT NULL DEFAULT NULL,
  `TimeZoneSidKey` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `TimesTriggered` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CspTrustedSite
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CspTrustedSite` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `EndpointUrl` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CustomBrand
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CustomBrand` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CustomBrandAsset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CustomBrandAsset` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CustomBrandId` LONGTEXT NULL DEFAULT NULL,
  `AssetCategory` LONGTEXT NULL DEFAULT NULL,
  `TextAsset` LONGTEXT NULL DEFAULT NULL,
  `ForeignKeyAssetId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CustomObjectUserLicenseMetrics
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CustomObjectUserLicenseMetrics` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MetricsDate` DATE NULL DEFAULT NULL,
  `UserLicenseId` LONGTEXT NULL DEFAULT NULL,
  `CustomObjectId` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CustomObjectType` LONGTEXT NULL DEFAULT NULL,
  `CustomObjectName` LONGTEXT NULL DEFAULT NULL,
  `ObjectCount` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CustomPermission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CustomPermission` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `IsProtected` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.CustomPermissionDependency
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`CustomPermissionDependency` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CustomPermissionId` LONGTEXT NULL DEFAULT NULL,
  `RequiredCustomPermissionId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Custom_Attachments__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Custom_Attachments__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Attachment__c` LONGTEXT NULL DEFAULT NULL,
  `Description__c` LONGTEXT NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `View__c` LONGTEXT NULL DEFAULT NULL,
  `Report_Date__c` DATE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Dashboard
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Dashboard` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `FolderId` LONGTEXT NULL DEFAULT NULL,
  `FolderName` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `LeftSize` LONGTEXT NULL DEFAULT NULL,
  `MiddleSize` LONGTEXT NULL DEFAULT NULL,
  `RightSize` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `RunningUserId` LONGTEXT NULL DEFAULT NULL,
  `TitleColor` INT NULL DEFAULT NULL,
  `TitleSize` INT NULL DEFAULT NULL,
  `TextColor` INT NULL DEFAULT NULL,
  `BackgroundStart` INT NULL DEFAULT NULL,
  `BackgroundEnd` INT NULL DEFAULT NULL,
  `BackgroundDirection` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `DashboardResultRefreshedDate` LONGTEXT NULL DEFAULT NULL,
  `DashboardResultRunningUser` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DashboardComponent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DashboardComponent` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DashboardId` LONGTEXT NULL DEFAULT NULL,
  `CustomReportId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DashboardComponentFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DashboardComponentFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DashboardFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DashboardFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DataAssessmentFieldMetric
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DataAssessmentFieldMetric` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `DataAssessmentMetricId` LONGTEXT NULL DEFAULT NULL,
  `FieldName` LONGTEXT NULL DEFAULT NULL,
  `NumMatchedInSync` INT NULL DEFAULT NULL,
  `NumMatchedDifferent` INT NULL DEFAULT NULL,
  `NumMatchedBlanks` INT NULL DEFAULT NULL,
  `NumUnmatchedBlanks` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DataAssessmentMetric
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DataAssessmentMetric` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `NumTotal` INT NULL DEFAULT NULL,
  `NumProcessed` INT NULL DEFAULT NULL,
  `NumMatched` INT NULL DEFAULT NULL,
  `NumMatchedDifferent` INT NULL DEFAULT NULL,
  `NumUnmatched` INT NULL DEFAULT NULL,
  `NumDuplicates` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DataAssessmentValueMetric
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DataAssessmentValueMetric` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `DataAssessmentFieldMetricId` LONGTEXT NULL DEFAULT NULL,
  `FieldValue` LONGTEXT NULL DEFAULT NULL,
  `ValueCount` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DataType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DataType` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `IsComplex` BOOLEAN NULL DEFAULT NULL,
  `ContextServiceDataTypeId` LONGTEXT NULL DEFAULT NULL,
  `ContextWsdlDataTypeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DeclinedEventRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DeclinedEventRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `EventId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `RespondedDate` DATETIME NULL DEFAULT NULL,
  `Response` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Document
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Document` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FolderId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `ContentType` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `IsPublic` BOOLEAN NULL DEFAULT NULL,
  `BodyLength` INT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `Url` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Keywords` LONGTEXT NULL DEFAULT NULL,
  `IsInternalUseOnly` BOOLEAN NULL DEFAULT NULL,
  `AuthorId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsBodySearchable` BOOLEAN NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DocumentAttachmentMap
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DocumentAttachmentMap` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `DocumentId` LONGTEXT NULL DEFAULT NULL,
  `DocumentSequence` INT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Domain
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Domain` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DomainType` LONGTEXT NULL DEFAULT NULL,
  `Domain` LONGTEXT NULL DEFAULT NULL,
  `OptionsExternalHttps` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DomainSite
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DomainSite` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DomainId` LONGTEXT NULL DEFAULT NULL,
  `SiteId` LONGTEXT NULL DEFAULT NULL,
  `PathPrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DuplicateRecordItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DuplicateRecordItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `DuplicateRecordSetId` LONGTEXT NULL DEFAULT NULL,
  `RecordId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DuplicateRecordSet
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DuplicateRecordSet` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `DuplicateRuleId` LONGTEXT NULL DEFAULT NULL,
  `RecordCount` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.DuplicateRule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`DuplicateRule` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `SobjectSubtype` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ELTF_Claims__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ELTF_Claims__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Claim_Number__c` DOUBLE NULL DEFAULT NULL,
  `Received_Date__c` DATE NULL DEFAULT NULL,
  `Amount_Requested__c` LONGTEXT NULL DEFAULT NULL,
  `Amount_To_Be_Reinbursed__c` LONGTEXT NULL DEFAULT NULL,
  `Reviewed_By_Claim_Reviewer__c` DATE NULL DEFAULT NULL,
  `Date_Sent_to_IDEM_Accounting__c` DATE NULL DEFAULT NULL,
  `Possible_Reimbursement_Date__c` DATE NULL DEFAULT NULL,
  `Actual_Reimbursement_Date__c` DATE NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `Lead__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailCapture
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailCapture` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `ToPattern` LONGTEXT NULL DEFAULT NULL,
  `FromPattern` LONGTEXT NULL DEFAULT NULL,
  `Sender` LONGTEXT NULL DEFAULT NULL,
  `Recipient` LONGTEXT NULL DEFAULT NULL,
  `CaptureDate` DATETIME NULL DEFAULT NULL,
  `RawMessageLength` INT NULL DEFAULT NULL,
  `RawMessage` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailDomainKey
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailDomainKey` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Selector` LONGTEXT NULL DEFAULT NULL,
  `Domain` LONGTEXT NULL DEFAULT NULL,
  `DomainMatch` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `PublicKey` LONGTEXT NULL DEFAULT NULL,
  `PrivateKey` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailMessage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailMessage` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `ActivityId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `TextBody` LONGTEXT NULL DEFAULT NULL,
  `HtmlBody` LONGTEXT NULL DEFAULT NULL,
  `Headers` LONGTEXT NULL DEFAULT NULL,
  `Subject` LONGTEXT NULL DEFAULT NULL,
  `FromName` LONGTEXT NULL DEFAULT NULL,
  `FromAddress` LONGTEXT NULL DEFAULT NULL,
  `ValidatedFromAddress` LONGTEXT NULL DEFAULT NULL,
  `ToAddress` LONGTEXT NULL DEFAULT NULL,
  `CcAddress` LONGTEXT NULL DEFAULT NULL,
  `BccAddress` LONGTEXT NULL DEFAULT NULL,
  `Incoming` BOOLEAN NULL DEFAULT NULL,
  `HasAttachment` BOOLEAN NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `MessageDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ReplyToEmailMessageId` LONGTEXT NULL DEFAULT NULL,
  `IsExternallyVisible` BOOLEAN NULL DEFAULT NULL,
  `MessageIdentifier` LONGTEXT NULL DEFAULT NULL,
  `ThreadIdentifier` LONGTEXT NULL DEFAULT NULL,
  `RelatedToId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailMessageRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailMessageRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `EmailMessageId` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `RelationType` LONGTEXT NULL DEFAULT NULL,
  `RelationAddress` LONGTEXT NULL DEFAULT NULL,
  `RelationObjectType` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailServicesAddress
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailServicesAddress` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `LocalPart` LONGTEXT NULL DEFAULT NULL,
  `EmailDomainName` LONGTEXT NULL DEFAULT NULL,
  `AuthorizedSenders` LONGTEXT NULL DEFAULT NULL,
  `RunAsUserId` LONGTEXT NULL DEFAULT NULL,
  `FunctionId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailServicesFunction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailServicesFunction` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `FunctionName` LONGTEXT NULL DEFAULT NULL,
  `AuthorizedSenders` LONGTEXT NULL DEFAULT NULL,
  `IsAuthenticationRequired` BOOLEAN NULL DEFAULT NULL,
  `IsTlsRequired` BOOLEAN NULL DEFAULT NULL,
  `AttachmentOption` LONGTEXT NULL DEFAULT NULL,
  `ApexClassId` LONGTEXT NULL DEFAULT NULL,
  `OverLimitAction` LONGTEXT NULL DEFAULT NULL,
  `FunctionInactiveAction` LONGTEXT NULL DEFAULT NULL,
  `AddressInactiveAction` LONGTEXT NULL DEFAULT NULL,
  `AuthenticationFailureAction` LONGTEXT NULL DEFAULT NULL,
  `AuthorizationFailureAction` LONGTEXT NULL DEFAULT NULL,
  `IsErrorRoutingEnabled` BOOLEAN NULL DEFAULT NULL,
  `ErrorRoutingAddress` LONGTEXT NULL DEFAULT NULL,
  `IsTextAttachmentsAsBinary` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmailTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmailTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `FolderId` LONGTEXT NULL DEFAULT NULL,
  `BrandTemplateId` LONGTEXT NULL DEFAULT NULL,
  `TemplateStyle` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `TemplateType` LONGTEXT NULL DEFAULT NULL,
  `Encoding` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Subject` LONGTEXT NULL DEFAULT NULL,
  `HtmlValue` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `TimesUsed` INT NULL DEFAULT NULL,
  `LastUsedDate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `Markup` LONGTEXT NULL DEFAULT NULL,
  `UiType` LONGTEXT NULL DEFAULT NULL,
  `RelatedEntityType` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EmbeddedServiceDetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EmbeddedServiceDetail` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `Site` LONGTEXT NULL DEFAULT NULL,
  `PrimaryColor` LONGTEXT NULL DEFAULT NULL,
  `SecondaryColor` LONGTEXT NULL DEFAULT NULL,
  `ContrastPrimaryColor` LONGTEXT NULL DEFAULT NULL,
  `NavBarColor` LONGTEXT NULL DEFAULT NULL,
  `Font` LONGTEXT NULL DEFAULT NULL,
  `IsPrechatEnabled` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EntityDefinition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EntityDefinition` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `QualifiedApiName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `PluralLabel` LONGTEXT NULL DEFAULT NULL,
  `DefaultCompactLayoutId` LONGTEXT NULL DEFAULT NULL,
  `IsCustomizable` BOOLEAN NULL DEFAULT NULL,
  `IsApexTriggerable` BOOLEAN NULL DEFAULT NULL,
  `IsWorkflowEnabled` BOOLEAN NULL DEFAULT NULL,
  `IsProcessEnabled` BOOLEAN NULL DEFAULT NULL,
  `IsCompactLayoutable` BOOLEAN NULL DEFAULT NULL,
  `KeyPrefix` LONGTEXT NULL DEFAULT NULL,
  `IsCustomSetting` BOOLEAN NULL DEFAULT NULL,
  `IsDeprecatedAndHidden` BOOLEAN NULL DEFAULT NULL,
  `IsReplicateable` BOOLEAN NULL DEFAULT NULL,
  `IsRetrieveable` BOOLEAN NULL DEFAULT NULL,
  `IsSearchLayoutable` BOOLEAN NULL DEFAULT NULL,
  `IsSearchable` BOOLEAN NULL DEFAULT NULL,
  `IsTriggerable` BOOLEAN NULL DEFAULT NULL,
  `IsIdEnabled` BOOLEAN NULL DEFAULT NULL,
  `IsEverCreatable` BOOLEAN NULL DEFAULT NULL,
  `IsEverUpdatable` BOOLEAN NULL DEFAULT NULL,
  `IsEverDeletable` BOOLEAN NULL DEFAULT NULL,
  `IsFeedEnabled` BOOLEAN NULL DEFAULT NULL,
  `IsQueryable` BOOLEAN NULL DEFAULT NULL,
  `IsMruEnabled` BOOLEAN NULL DEFAULT NULL,
  `DetailUrl` LONGTEXT NULL DEFAULT NULL,
  `EditUrl` LONGTEXT NULL DEFAULT NULL,
  `NewUrl` LONGTEXT NULL DEFAULT NULL,
  `EditDefinitionUrl` LONGTEXT NULL DEFAULT NULL,
  `HelpSettingPageName` LONGTEXT NULL DEFAULT NULL,
  `HelpSettingPageUrl` LONGTEXT NULL DEFAULT NULL,
  `RunningUserEntityAccessId` LONGTEXT NULL DEFAULT NULL,
  `PublisherId` LONGTEXT NULL DEFAULT NULL,
  `IsLayoutable` BOOLEAN NULL DEFAULT NULL,
  `RecordTypesSupported` LONGTEXT NULL DEFAULT NULL,
  `InternalSharingModel` LONGTEXT NULL DEFAULT NULL,
  `ExternalSharingModel` LONGTEXT NULL DEFAULT NULL,
  `HasSubtypes` BOOLEAN NULL DEFAULT NULL,
  `IsSubtype` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EntitySubscription
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EntitySubscription` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `SubscriberId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Event
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Event` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `WhoId` LONGTEXT NULL DEFAULT NULL,
  `WhatId` LONGTEXT NULL DEFAULT NULL,
  `WhoCount` INT NULL DEFAULT NULL,
  `WhatCount` INT NULL DEFAULT NULL,
  `Subject` LONGTEXT NULL DEFAULT NULL,
  `Location` LONGTEXT NULL DEFAULT NULL,
  `IsAllDayEvent` BOOLEAN NULL DEFAULT NULL,
  `ActivityDateTime` DATETIME NULL DEFAULT NULL,
  `ActivityDate` DATE NULL DEFAULT NULL,
  `DurationInMinutes` INT NULL DEFAULT NULL,
  `StartDateTime` DATETIME NULL DEFAULT NULL,
  `EndDateTime` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `IsPrivate` BOOLEAN NULL DEFAULT NULL,
  `ShowAs` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `IsChild` BOOLEAN NULL DEFAULT NULL,
  `IsGroupEvent` BOOLEAN NULL DEFAULT NULL,
  `GroupEventType` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `RecurrenceActivityId` LONGTEXT NULL DEFAULT NULL,
  `IsRecurrence` BOOLEAN NULL DEFAULT NULL,
  `RecurrenceStartDateTime` DATETIME NULL DEFAULT NULL,
  `RecurrenceEndDateOnly` DATE NULL DEFAULT NULL,
  `RecurrenceTimeZoneSidKey` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceType` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceInterval` INT NULL DEFAULT NULL,
  `RecurrenceDayOfWeekMask` INT NULL DEFAULT NULL,
  `RecurrenceDayOfMonth` INT NULL DEFAULT NULL,
  `RecurrenceInstance` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceMonthOfYear` LONGTEXT NULL DEFAULT NULL,
  `ReminderDateTime` DATETIME NULL DEFAULT NULL,
  `IsReminderSet` BOOLEAN NULL DEFAULT NULL,
  `EventSubtype` LONGTEXT NULL DEFAULT NULL,
  `Assigned_to_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `ELTF__c` DOUBLE NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Last_Update__c` DATE NULL DEFAULT NULL,
  `UST_Last_Update__c` DATE NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EventBusSubscriber
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EventBusSubscriber` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ExternalId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Topic` LONGTEXT NULL DEFAULT NULL,
  `Position` INT NULL DEFAULT NULL,
  `Tip` INT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EventFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EventFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EventLogFile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EventLogFile` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `EventType` LONGTEXT NULL DEFAULT NULL,
  `LogDate` DATETIME NULL DEFAULT NULL,
  `LogFileLength` DOUBLE NULL DEFAULT NULL,
  `LogFileContentType` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `LogFileFieldNames` LONGTEXT NULL DEFAULT NULL,
  `LogFileFieldTypes` LONGTEXT NULL DEFAULT NULL,
  `LogFile` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EventRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EventRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `EventId` LONGTEXT NULL DEFAULT NULL,
  `IsWhat` BOOLEAN NULL DEFAULT NULL,
  `IsParent` BOOLEAN NULL DEFAULT NULL,
  `IsInvitee` BOOLEAN NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `RespondedDate` DATETIME NULL DEFAULT NULL,
  `Response` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.EventWhoRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`EventWhoRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `EventId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Event_Attendee__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Event_Attendee__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Attendee__c` LONGTEXT NULL DEFAULT NULL,
  `Company__c` LONGTEXT NULL DEFAULT NULL,
  `Attendee_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Meal_Opt_IN__c` BOOLEAN NULL DEFAULT NULL,
  `Occasional_Event__c` LONGTEXT NULL DEFAULT NULL,
  `Speaker__c` BOOLEAN NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL,
  `Email_Invite__c` BOOLEAN NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Pledge_Fund__c` LONGTEXT NULL DEFAULT NULL,
  `Host_Co_Host__c` BOOLEAN NULL DEFAULT NULL,
  `Mass_Invite__c` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Event_Organizer__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Event_Organizer__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Event__c` LONGTEXT NULL DEFAULT NULL,
  `Organizing_Company__c` LONGTEXT NULL DEFAULT NULL,
  `Organizing_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Organizer_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Cost__c` LONGTEXT NULL DEFAULT NULL,
  `Golars_Contact__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ExternalDataSource
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ExternalDataSource` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Endpoint` LONGTEXT NULL DEFAULT NULL,
  `Repository` LONGTEXT NULL DEFAULT NULL,
  `IsWritable` BOOLEAN NULL DEFAULT NULL,
  `PrincipalType` LONGTEXT NULL DEFAULT NULL,
  `Protocol` LONGTEXT NULL DEFAULT NULL,
  `AuthProviderId` LONGTEXT NULL DEFAULT NULL,
  `LargeIconId` LONGTEXT NULL DEFAULT NULL,
  `SmallIconId` LONGTEXT NULL DEFAULT NULL,
  `CustomConfiguration` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ExternalDataUserAuth
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ExternalDataUserAuth` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ExternalDataSourceId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `Protocol` LONGTEXT NULL DEFAULT NULL,
  `Username` LONGTEXT NULL DEFAULT NULL,
  `Password` LONGTEXT NULL DEFAULT NULL,
  `AuthProviderId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Facility_Management__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Facility_Management__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Company__c` LONGTEXT NULL DEFAULT NULL,
  `Contact__c` LONGTEXT NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Operator_Company__c` BOOLEAN NULL DEFAULT NULL,
  `Property_Owner__c` BOOLEAN NULL DEFAULT NULL,
  `UST_Owner_Company__c` BOOLEAN NULL DEFAULT NULL,
  `MGT_Project__c` LONGTEXT NULL DEFAULT NULL,
  `Facilities__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `Golars_Tank_Paid_Service__c` BOOLEAN NULL DEFAULT NULL,
  `USSBOA_Paid_Service__c` BOOLEAN NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `Street__c` LONGTEXT NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Address__c` LONGTEXT NULL DEFAULT NULL,
  `GOLARS_Project__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration__c` DOUBLE NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedAttachment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FeedEntityId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `RecordId` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedComment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedComment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FeedItemId` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Revision` INT NULL DEFAULT NULL,
  `LastEditById` LONGTEXT NULL DEFAULT NULL,
  `LastEditDate` DATETIME NULL DEFAULT NULL,
  `CommentBody` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL,
  `CommentType` LONGTEXT NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Revision` INT NULL DEFAULT NULL,
  `LastEditById` LONGTEXT NULL DEFAULT NULL,
  `LastEditDate` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL,
  `BestCommentId` LONGTEXT NULL DEFAULT NULL,
  `HasContent` BOOLEAN NULL DEFAULT NULL,
  `HasLink` BOOLEAN NULL DEFAULT NULL,
  `HasFeedEntity` BOOLEAN NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedPollChoice
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedPollChoice` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FeedItemId` LONGTEXT NULL DEFAULT NULL,
  `Position` INT NULL DEFAULT NULL,
  `ChoiceBody` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedPollVote
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedPollVote` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FeedItemId` LONGTEXT NULL DEFAULT NULL,
  `ChoiceId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FeedRevision
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FeedRevision` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `FeedEntityId` LONGTEXT NULL DEFAULT NULL,
  `Revision` INT NULL DEFAULT NULL,
  `Action` LONGTEXT NULL DEFAULT NULL,
  `EditedAttribute` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `IsValueRichText` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FieldPermissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FieldPermissions` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `PermissionsEdit` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRead` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FileSearchActivity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FileSearchActivity` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SearchTerm` LONGTEXT NULL DEFAULT NULL,
  `QueryDate` DATE NULL DEFAULT NULL,
  `CountQueries` INT NULL DEFAULT NULL,
  `CountUsers` INT NULL DEFAULT NULL,
  `AvgNumResults` DOUBLE NULL DEFAULT NULL,
  `Period` LONGTEXT NULL DEFAULT NULL,
  `QueryLanguage` LONGTEXT NULL DEFAULT NULL,
  `ClickRank` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FiscalYearSettings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FiscalYearSettings` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `IsStandardYear` BOOLEAN NULL DEFAULT NULL,
  `YearType` LONGTEXT NULL DEFAULT NULL,
  `QuarterLabelScheme` LONGTEXT NULL DEFAULT NULL,
  `PeriodLabelScheme` LONGTEXT NULL DEFAULT NULL,
  `WeekLabelScheme` LONGTEXT NULL DEFAULT NULL,
  `QuarterPrefix` LONGTEXT NULL DEFAULT NULL,
  `PeriodPrefix` LONGTEXT NULL DEFAULT NULL,
  `WeekStartDay` INT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FlowInterview
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FlowInterview` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CurrentElement` LONGTEXT NULL DEFAULT NULL,
  `InterviewLabel` LONGTEXT NULL DEFAULT NULL,
  `PauseLabel` LONGTEXT NULL DEFAULT NULL,
  `Guid` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.FlowInterviewShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`FlowInterviewShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Folder
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Folder` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `AccessType` LONGTEXT NULL DEFAULT NULL,
  `IsReadonly` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserRoleId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `CanSubmit` BOOLEAN NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingAdjustment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingAdjustment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemId` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `ProductFamily` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `AdjustedAmount` LONGTEXT NULL DEFAULT NULL,
  `AdjustedQuantity` DOUBLE NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsAmount` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL,
  `AdjustmentNote` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingCategoryMapping
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingCategoryMapping` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SourceCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemCategory` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingFact
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingFact` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `ForecastedObjectId` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemId` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `ParentForecastingItemId` LONGTEXT NULL DEFAULT NULL,
  `ProductFamily` LONGTEXT NULL DEFAULT NULL,
  `OwnerOnlyAmount` LONGTEXT NULL DEFAULT NULL,
  `AmountWithoutAdjustments` LONGTEXT NULL DEFAULT NULL,
  `AmountWithoutManagerAdjustment` LONGTEXT NULL DEFAULT NULL,
  `ForecastAmount` LONGTEXT NULL DEFAULT NULL,
  `OwnerOnlyQuantity` DOUBLE NULL DEFAULT NULL,
  `QuantityWithoutAdjustments` DOUBLE NULL DEFAULT NULL,
  `QuantityWithoutManagerAdjustment` DOUBLE NULL DEFAULT NULL,
  `ForecastQuantity` DOUBLE NULL DEFAULT NULL,
  `IsQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsAmount` BOOLEAN NULL DEFAULT NULL,
  `HasAdjustment` BOOLEAN NULL DEFAULT NULL,
  `HasOwnerAdjustment` BOOLEAN NULL DEFAULT NULL,
  `IsUpToDate` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL,
  `AmountWithoutOwnerAdjustment` LONGTEXT NULL DEFAULT NULL,
  `QuantityWithoutOwnerAdjustment` DOUBLE NULL DEFAULT NULL,
  `SubordinateOverrides` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingOwnerAdjustment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingOwnerAdjustment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingItemId` LONGTEXT NULL DEFAULT NULL,
  `OwnerAdjustedAmount` LONGTEXT NULL DEFAULT NULL,
  `OwnerAdjustedQuantity` DOUBLE NULL DEFAULT NULL,
  `OwnerAdjustmentNote` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `ForecastOwnerId` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `ProductFamily` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `IsQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsAmount` BOOLEAN NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingQuota
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingQuota` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `PeriodId` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `ProductFamily` LONGTEXT NULL DEFAULT NULL,
  `QuotaAmount` LONGTEXT NULL DEFAULT NULL,
  `QuotaQuantity` DOUBLE NULL DEFAULT NULL,
  `QuotaOwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsAmount` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingType` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `IsQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsAmount` BOOLEAN NULL DEFAULT NULL,
  `CanDisplayQuotas` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingTypeToCategory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingTypeToCategory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ForecastingTypeId` LONGTEXT NULL DEFAULT NULL,
  `ForecastingItemCategory` LONGTEXT NULL DEFAULT NULL,
  `DisplayPosition` INT NULL DEFAULT NULL,
  `IsAdjustable` BOOLEAN NULL DEFAULT NULL,
  `IsOwnerAdjustable` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ForecastingUserPreference
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ForecastingUserPreference` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ExternalId` LONGTEXT NULL DEFAULT NULL,
  `ForecastingStartPeriod` INT NULL DEFAULT NULL,
  `ForecastingPeriodDuration` INT NULL DEFAULT NULL,
  `ForecastingPeriodType` LONGTEXT NULL DEFAULT NULL,
  `ForecastingDisplayedTypeId` LONGTEXT NULL DEFAULT NULL,
  `ForecastingViewCurrency` LONGTEXT NULL DEFAULT NULL,
  `IsHideForecastingGuidedTour` BOOLEAN NULL DEFAULT NULL,
  `IsShowForecastingQuotaAttainment` BOOLEAN NULL DEFAULT NULL,
  `IsHideForecastingQuotaColumn` BOOLEAN NULL DEFAULT NULL,
  `IsForecastingShowQuantity` BOOLEAN NULL DEFAULT NULL,
  `IsForecastingHideZeroRows` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Gift_Tracker__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Gift_Tracker__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Gift_Tracker__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Gift_Tracker__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Customer_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Gift_Description__c` LONGTEXT NULL DEFAULT NULL,
  `Gift__c` LONGTEXT NULL DEFAULT NULL,
  `Gifted_On__c` DATE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Gift__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Gift__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Gift__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Gift__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `Brand__c` LONGTEXT NULL DEFAULT NULL,
  `Model__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.GrantedByLicense
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`GrantedByLicense` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `PermissionSetLicenseId` LONGTEXT NULL DEFAULT NULL,
  `CustomPermissionId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Group
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Group` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `RelatedId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `DoesSendEmailToMembers` BOOLEAN NULL DEFAULT NULL,
  `DoesIncludeBosses` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.GroupMember
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`GroupMember` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `GroupId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Holiday
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Holiday` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsAllDay` BOOLEAN NULL DEFAULT NULL,
  `ActivityDate` DATE NULL DEFAULT NULL,
  `StartTimeInMinutes` INT NULL DEFAULT NULL,
  `EndTimeInMinutes` INT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsRecurrence` BOOLEAN NULL DEFAULT NULL,
  `RecurrenceStartDate` DATE NULL DEFAULT NULL,
  `RecurrenceEndDateOnly` DATE NULL DEFAULT NULL,
  `RecurrenceType` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceInterval` INT NULL DEFAULT NULL,
  `RecurrenceDayOfWeekMask` INT NULL DEFAULT NULL,
  `RecurrenceDayOfMonth` INT NULL DEFAULT NULL,
  `RecurrenceInstance` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceMonthOfYear` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Idea
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Idea` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `CommunityId` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `NumComments` INT NULL DEFAULT NULL,
  `VoteScore` DOUBLE NULL DEFAULT NULL,
  `VoteTotal` DOUBLE NULL DEFAULT NULL,
  `Categories` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `LastCommentDate` DATETIME NULL DEFAULT NULL,
  `LastCommentId` LONGTEXT NULL DEFAULT NULL,
  `ParentIdeaId` LONGTEXT NULL DEFAULT NULL,
  `IsHtml` BOOLEAN NULL DEFAULT NULL,
  `IsMerged` BOOLEAN NULL DEFAULT NULL,
  `CreatorFullPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `CreatorSmallPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `CreatorName` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.IdpEventLog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`IdpEventLog` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `InitiatedBy` LONGTEXT NULL DEFAULT NULL,
  `Timestamp` DATETIME NULL DEFAULT NULL,
  `ErrorCode` LONGTEXT NULL DEFAULT NULL,
  `SamlEntityUrl` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `AuthSessionId` LONGTEXT NULL DEFAULT NULL,
  `SsoType` LONGTEXT NULL DEFAULT NULL,
  `AppId` LONGTEXT NULL DEFAULT NULL,
  `IdentityUsed` LONGTEXT NULL DEFAULT NULL,
  `OptionsHasLogoutUrl` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.InstalledMobileApp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`InstalledMobileApp` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `ConnectedApplicationId` LONGTEXT NULL DEFAULT NULL,
  `Version` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Insurance_Coverage__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Insurance_Coverage__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Attorney_Company__c` LONGTEXT NULL DEFAULT NULL,
  `Attorney__c` LONGTEXT NULL DEFAULT NULL,
  `Claim_Approved__c` BOOLEAN NULL DEFAULT NULL,
  `Claim_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Coverage__c` DOUBLE NULL DEFAULT NULL,
  `Insurance_Company__c` LONGTEXT NULL DEFAULT NULL,
  `Insurance_Ownership__c` LONGTEXT NULL DEFAULT NULL,
  `Ownership__c` LONGTEXT NULL DEFAULT NULL,
  `Policy_End_Date__c` DATE NULL DEFAULT NULL,
  `Policy_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Policy_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `Policy_Start_Date__c` DATE NULL DEFAULT NULL,
  `Policy_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Reason_for_Denial__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Interaction__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Interaction__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Interaction__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Interaction__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Interaction_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Location__c` LONGTEXT NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `ZIP_Postal_Code__c` LONGTEXT NULL DEFAULT NULL,
  `Product_Priority_1__c` LONGTEXT NULL DEFAULT NULL,
  `Product_Priority_2__c` LONGTEXT NULL DEFAULT NULL,
  `Product_Priority_3__c` LONGTEXT NULL DEFAULT NULL,
  `Product_Priority_4__c` LONGTEXT NULL DEFAULT NULL,
  `Discussion_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Discussed_With__c` LONGTEXT NULL DEFAULT NULL,
  `Related_To_Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Related_Event__c` LONGTEXT NULL DEFAULT NULL,
  `Related_Contact__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.InventoryReport__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`InventoryReport__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Date__c` DATE NULL DEFAULT NULL,
  `TANK__c` DOUBLE NULL DEFAULT NULL,
  `PRODUCT__c` LONGTEXT NULL DEFAULT NULL,
  `GALLONS__c` DOUBLE NULL DEFAULT NULL,
  `INCHES__c` DOUBLE NULL DEFAULT NULL,
  `WATER__c` DOUBLE NULL DEFAULT NULL,
  `DEGF__c` DOUBLE NULL DEFAULT NULL,
  `ULLAGE__c` DOUBLE NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.KnowledgeableUser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`KnowledgeableUser` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `TopicId` LONGTEXT NULL DEFAULT NULL,
  `RawRank` INT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Lead
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Lead` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `MasterRecordId` LONGTEXT NULL DEFAULT NULL,
  `LastName` LONGTEXT NULL DEFAULT NULL,
  `FirstName` LONGTEXT NULL DEFAULT NULL,
  `Salutation` LONGTEXT NULL DEFAULT NULL,
  `MiddleName` LONGTEXT NULL DEFAULT NULL,
  `Suffix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Company` LONGTEXT NULL DEFAULT NULL,
  `Street` LONGTEXT NULL DEFAULT NULL,
  `City` LONGTEXT NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `PostalCode` LONGTEXT NULL DEFAULT NULL,
  `Country` LONGTEXT NULL DEFAULT NULL,
  `Latitude` DOUBLE NULL DEFAULT NULL,
  `Longitude` DOUBLE NULL DEFAULT NULL,
  `GeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `Address` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `MobilePhone` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `Website` LONGTEXT NULL DEFAULT NULL,
  `PhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `LeadSource` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Industry` LONGTEXT NULL DEFAULT NULL,
  `Rating` LONGTEXT NULL DEFAULT NULL,
  `NumberOfEmployees` INT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsConverted` BOOLEAN NULL DEFAULT NULL,
  `ConvertedDate` DATE NULL DEFAULT NULL,
  `ConvertedAccountId` LONGTEXT NULL DEFAULT NULL,
  `ConvertedContactId` LONGTEXT NULL DEFAULT NULL,
  `ConvertedOpportunityId` LONGTEXT NULL DEFAULT NULL,
  `IsUnreadByOwner` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `JigsawContactId` LONGTEXT NULL DEFAULT NULL,
  `EmailBouncedReason` LONGTEXT NULL DEFAULT NULL,
  `EmailBouncedDate` DATETIME NULL DEFAULT NULL,
  `Actual_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `County__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Percent__c` DOUBLE NULL DEFAULT NULL,
  `Existing_Client__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Incident_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Last_Site_Closure_Date__c` DATE NULL DEFAULT NULL,
  `Lead_Description__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Program_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Card_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Remidiation_System__c` BOOLEAN NULL DEFAULT NULL,
  `Scope_Of_Work__c` LONGTEXT NULL DEFAULT NULL,
  `Site_Contaminated__c` BOOLEAN NULL DEFAULT NULL,
  `Status_of_Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Year_of_Tank_Installation__c` LONGTEXT NULL DEFAULT NULL,
  `of_ELTF_Claims__c` DOUBLE NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Environmental_Consultant__c` LONGTEXT NULL DEFAULT NULL,
  `Remediation_Status__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Last_Update__c` DATE NULL DEFAULT NULL,
  `UST_Last_Update__c` DATE NULL DEFAULT NULL,
  `ELTF_Last_Update__c` DATE NULL DEFAULT NULL,
  `Vendor_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Type2__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Name2__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Type3__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Name3__c` LONGTEXT NULL DEFAULT NULL,
  `property_Type__c` LONGTEXT NULL DEFAULT NULL,
  `TANK_CAPACITY__c` DOUBLE NULL DEFAULT NULL,
  `Tank_status__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Number__c` DOUBLE NULL DEFAULT NULL,
  `Tank_Closure_Date__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Qualification__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Operation_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Operation_Start_Date__c` LONGTEXT NULL DEFAULT NULL,
  `DC_Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `DC_Document_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Property_for_Sale__c` BOOLEAN NULL DEFAULT NULL,
  `Assessed_Value__c` DOUBLE NULL DEFAULT NULL,
  `Address__c` LONGTEXT NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `Zip__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Tax_Sale__c` BOOLEAN NULL DEFAULT NULL,
  `TANK_SUBSTANCE_DESCRIPTION__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Tetrachloroethene__c` DOUBLE NULL DEFAULT NULL,
  `Trichloroethene__c` DOUBLE NULL DEFAULT NULL,
  `Dichloroethene__c` DOUBLE NULL DEFAULT NULL,
  `vinyl_chloride__c` DOUBLE NULL DEFAULT NULL,
  `DC_Document_Date__c` DATE NULL DEFAULT NULL,
  `Monitoring_Well_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Conversion__c` BOOLEAN NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL,
  `IDEM_Inspector__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Inspector__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Project_Manager__c` LONGTEXT NULL DEFAULT NULL,
  `Region__c` DOUBLE NULL DEFAULT NULL,
  `Event_Source__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Type__c` LONGTEXT NULL DEFAULT NULL,
  `UST_Owner_at_Time_of_Release__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LeadFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LeadFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LeadHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LeadHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LeadId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LeadShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LeadShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `LeadId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `LeadAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LeadStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LeadStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `IsConverted` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Lead_Vendor__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Lead_Vendor__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Site_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Type__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `Facility_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Contact_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Qualification__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Site_Contaminated__c` BOOLEAN NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Tank_Installation_Year__c` LONGTEXT NULL DEFAULT NULL,
  `Operation_Start_Date__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LeakTestResults__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LeakTestResults__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Date__c` DATE NULL DEFAULT NULL,
  `TANK__c` LONGTEXT NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `TESTTYPE__c` LONGTEXT NULL DEFAULT NULL,
  `STARTTIME__c` DATETIME NULL DEFAULT NULL,
  `RESULT__c` LONGTEXT NULL DEFAULT NULL,
  `RATE__c` LONGTEXT NULL DEFAULT NULL,
  `HOURS__c` LONGTEXT NULL DEFAULT NULL,
  `VOLUME__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ListView
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ListView` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `IsSoqlCompatible` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ListViewChart
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ListViewChart` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `ChartType` LONGTEXT NULL DEFAULT NULL,
  `GroupingField` LONGTEXT NULL DEFAULT NULL,
  `AggregateField` LONGTEXT NULL DEFAULT NULL,
  `AggregateType` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Location__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Location__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LoginGeo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LoginGeo` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LoginTime` DATETIME NULL DEFAULT NULL,
  `CountryIso` LONGTEXT NULL DEFAULT NULL,
  `Country` LONGTEXT NULL DEFAULT NULL,
  `Latitude` DOUBLE NULL DEFAULT NULL,
  `Longitude` DOUBLE NULL DEFAULT NULL,
  `City` LONGTEXT NULL DEFAULT NULL,
  `PostalCode` LONGTEXT NULL DEFAULT NULL,
  `Subdivision` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LoginHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LoginHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `LoginTime` DATETIME NULL DEFAULT NULL,
  `LoginType` LONGTEXT NULL DEFAULT NULL,
  `SourceIp` LONGTEXT NULL DEFAULT NULL,
  `LoginUrl` LONGTEXT NULL DEFAULT NULL,
  `AuthenticationServiceId` LONGTEXT NULL DEFAULT NULL,
  `LoginGeoId` LONGTEXT NULL DEFAULT NULL,
  `TlsProtocol` LONGTEXT NULL DEFAULT NULL,
  `CipherSuite` LONGTEXT NULL DEFAULT NULL,
  `Browser` LONGTEXT NULL DEFAULT NULL,
  `Platform` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Application` LONGTEXT NULL DEFAULT NULL,
  `ClientVersion` LONGTEXT NULL DEFAULT NULL,
  `ApiType` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` LONGTEXT NULL DEFAULT NULL,
  `CountryIso` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.LoginIp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`LoginIp` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UsersId` LONGTEXT NULL DEFAULT NULL,
  `SourceIp` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsAuthenticated` BOOLEAN NULL DEFAULT NULL,
  `ChallengeSentDate` DATETIME NULL DEFAULT NULL,
  `ChallengeMethod` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Macro
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Macro` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MacroHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MacroHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `MacroId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MacroInstruction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MacroInstruction` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `MacroId` LONGTEXT NULL DEFAULT NULL,
  `Operation` LONGTEXT NULL DEFAULT NULL,
  `Target` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `ValueRecord` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MacroShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MacroShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MailmergeTemplate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MailmergeTemplate` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Filename` LONGTEXT NULL DEFAULT NULL,
  `BodyLength` INT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LastUsedDate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SecurityOptionsAttachmentScannedForXSS` BOOLEAN NULL DEFAULT NULL,
  `SecurityOptionsAttachmentHasXSSThreat` BOOLEAN NULL DEFAULT NULL,
  `SecurityOptionsAttachmentScannedforFlash` BOOLEAN NULL DEFAULT NULL,
  `SecurityOptionsAttachmentHasFlash` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MatchingRule
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MatchingRule` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `MatchEngine` LONGTEXT NULL DEFAULT NULL,
  `BooleanFilter` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `RuleStatus` LONGTEXT NULL DEFAULT NULL,
  `SobjectSubtype` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.MatchingRuleItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`MatchingRuleItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `MatchingRuleId` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `MatchingMethod` LONGTEXT NULL DEFAULT NULL,
  `BlankValueBehavior` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.NamedCredential
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`NamedCredential` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Endpoint` LONGTEXT NULL DEFAULT NULL,
  `PrincipalType` LONGTEXT NULL DEFAULT NULL,
  `CalloutOptionsGenerateAuthorizationHeader` BOOLEAN NULL DEFAULT NULL,
  `CalloutOptionsAllowMergeFieldsInHeader` BOOLEAN NULL DEFAULT NULL,
  `CalloutOptionsAllowMergeFieldsInBody` BOOLEAN NULL DEFAULT NULL,
  `AuthProviderId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Note
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Note` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `IsPrivate` BOOLEAN NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OauthToken
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OauthToken` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AccessToken` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `RequestToken` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `AppName` LONGTEXT NULL DEFAULT NULL,
  `LastUsedDate` DATETIME NULL DEFAULT NULL,
  `UseCount` INT NULL DEFAULT NULL,
  `DeleteToken` LONGTEXT NULL DEFAULT NULL,
  `AppMenuItemId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ObjectPermissions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ObjectPermissions` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `PermissionsCreate` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRead` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEdit` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDelete` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllRecords` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModifyAllRecords` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Occasional_Event__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Occasional_Event__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Host__c` LONGTEXT NULL DEFAULT NULL,
  `Active__c` BOOLEAN NULL DEFAULT NULL,
  `Address__c` LONGTEXT NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `Zip_Code__c` LONGTEXT NULL DEFAULT NULL,
  `Co_Host__c` LONGTEXT NULL DEFAULT NULL,
  `Cost__c` LONGTEXT NULL DEFAULT NULL,
  `Description__c` LONGTEXT NULL DEFAULT NULL,
  `Location__c` LONGTEXT NULL DEFAULT NULL,
  `Event_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Event_Subtype__c` LONGTEXT NULL DEFAULT NULL,
  `Event_Date__c` DATETIME NULL DEFAULT NULL,
  `Event_End_Date__c` DATETIME NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL,
  `Total_Attendees__c` DOUBLE NULL DEFAULT NULL,
  `Total_Invited__c` DOUBLE NULL DEFAULT NULL,
  `Total_Attended__c` DOUBLE NULL DEFAULT NULL,
  `Invite_Gas_Station_Owners__c` BOOLEAN NULL DEFAULT NULL,
  `Attorneys__c` BOOLEAN NULL DEFAULT NULL,
  `Invite_Fundraisers__c` BOOLEAN NULL DEFAULT NULL,
  `Invite_USSBOA_Members__c` BOOLEAN NULL DEFAULT NULL,
  `Invite_Internal_Employees__c` BOOLEAN NULL DEFAULT NULL,
  `Invited_Friends_and_Family__c` BOOLEAN NULL DEFAULT NULL,
  `Email_Template_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Fundraising_Target__c` LONGTEXT NULL DEFAULT NULL,
  `Total_Pledge__c` LONGTEXT NULL DEFAULT NULL,
  `Event_Minimum_Fee__c` LONGTEXT NULL DEFAULT NULL,
  `Invitees_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Total_Accepted__c` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Operator_History__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Operator_History__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Attorney_Company__c` LONGTEXT NULL DEFAULT NULL,
  `Attorney__c` LONGTEXT NULL DEFAULT NULL,
  `Coverage_Position__c` LONGTEXT NULL DEFAULT NULL,
  `Lease_End_Date__c` DATE NULL DEFAULT NULL,
  `Lease_Start_Date__c` DATE NULL DEFAULT NULL,
  `Operator_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Operator_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Ownership__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Opportunity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Opportunity` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `IsPrivate` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `StageName` LONGTEXT NULL DEFAULT NULL,
  `Amount` LONGTEXT NULL DEFAULT NULL,
  `Probability` DOUBLE NULL DEFAULT NULL,
  `TotalOpportunityQuantity` DOUBLE NULL DEFAULT NULL,
  `CloseDate` DATE NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `NextStep` LONGTEXT NULL DEFAULT NULL,
  `LeadSource` LONGTEXT NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `IsWon` BOOLEAN NULL DEFAULT NULL,
  `ForecastCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `CampaignId` LONGTEXT NULL DEFAULT NULL,
  `HasOpportunityLineItem` BOOLEAN NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `FiscalQuarter` INT NULL DEFAULT NULL,
  `FiscalYear` INT NULL DEFAULT NULL,
  `Fiscal` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `SyncedQuoteId` LONGTEXT NULL DEFAULT NULL,
  `ContractId` LONGTEXT NULL DEFAULT NULL,
  `HasOpenActivity` BOOLEAN NULL DEFAULT NULL,
  `HasOverdueTask` BOOLEAN NULL DEFAULT NULL,
  `Budget_Confirmed__c` BOOLEAN NULL DEFAULT NULL,
  `Discovery_Completed__c` BOOLEAN NULL DEFAULT NULL,
  `ROI_Analysis_Completed__c` BOOLEAN NULL DEFAULT NULL,
  `Actual_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `Loss_Reason__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Contact_Person__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Type__c` LONGTEXT NULL DEFAULT NULL,
  `ELTF_Percent__c` DOUBLE NULL DEFAULT NULL,
  `ELTF__c` BOOLEAN NULL DEFAULT NULL,
  `Existing_Client__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` DOUBLE NULL DEFAULT NULL,
  `Facility_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Fee_Information__c` LONGTEXT NULL DEFAULT NULL,
  `Fiscal_Month__c` LONGTEXT NULL DEFAULT NULL,
  `Fiscal_Quarter__c` LONGTEXT NULL DEFAULT NULL,
  `Incident_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Labor_Cost__c` DOUBLE NULL DEFAULT NULL,
  `Last_Site_Closure_Date__c` DATE NULL DEFAULT NULL,
  `MGT__c` BOOLEAN NULL DEFAULT NULL,
  `Markup__c` DOUBLE NULL DEFAULT NULL,
  `Non_ELTF__c` BOOLEAN NULL DEFAULT NULL,
  `Opportunity_Description__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Payment_Information__c` LONGTEXT NULL DEFAULT NULL,
  `Program_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Project_Circumstances__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Card_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Remidiation_System__c` BOOLEAN NULL DEFAULT NULL,
  `Schedule__c` LONGTEXT NULL DEFAULT NULL,
  `Scope_Of_Work__c` LONGTEXT NULL DEFAULT NULL,
  `Scope_Of_Work_text__c` LONGTEXT NULL DEFAULT NULL,
  `Site_Contaminated__c` BOOLEAN NULL DEFAULT NULL,
  `Status_of_Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Sub_Contractor_Cost__c` DOUBLE NULL DEFAULT NULL,
  `Supplement_Information__c` LONGTEXT NULL DEFAULT NULL,
  `Tank_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Terms_Conditions__c` LONGTEXT NULL DEFAULT NULL,
  `Year_of_Tank_Installation__c` LONGTEXT NULL DEFAULT NULL,
  `of_ELTF_Claims__c` DOUBLE NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Assigned_to__c` LONGTEXT NULL DEFAULT NULL,
  `Proposal_No__c` LONGTEXT NULL DEFAULT NULL,
  `Company_Name__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityCompetitor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityCompetitor` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `CompetitorName` LONGTEXT NULL DEFAULT NULL,
  `Strengths` LONGTEXT NULL DEFAULT NULL,
  `Weaknesses` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityContactRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityContactRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityFieldHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityFieldHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `StageName` LONGTEXT NULL DEFAULT NULL,
  `Amount` LONGTEXT NULL DEFAULT NULL,
  `ExpectedRevenue` LONGTEXT NULL DEFAULT NULL,
  `CloseDate` DATE NULL DEFAULT NULL,
  `Probability` DOUBLE NULL DEFAULT NULL,
  `ForecastCategory` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityLineItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityLineItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `PricebookEntryId` LONGTEXT NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `ProductCode` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Quantity` DOUBLE NULL DEFAULT NULL,
  `TotalPrice` LONGTEXT NULL DEFAULT NULL,
  `UnitPrice` LONGTEXT NULL DEFAULT NULL,
  `ListPrice` LONGTEXT NULL DEFAULT NULL,
  `ServiceDate` DATE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityPartner
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityPartner` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `AccountToId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ReversePartnerId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `OpportunityAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OpportunityStage
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OpportunityStage` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `IsWon` BOOLEAN NULL DEFAULT NULL,
  `ForecastCategory` LONGTEXT NULL DEFAULT NULL,
  `ForecastCategoryName` LONGTEXT NULL DEFAULT NULL,
  `DefaultProbability` DOUBLE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Order
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Order` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `ContractId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `OriginalOrderId` LONGTEXT NULL DEFAULT NULL,
  `EffectiveDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `IsReductionOrder` BOOLEAN NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CustomerAuthorizedById` LONGTEXT NULL DEFAULT NULL,
  `CompanyAuthorizedById` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `BillingStreet` LONGTEXT NULL DEFAULT NULL,
  `BillingCity` LONGTEXT NULL DEFAULT NULL,
  `BillingState` LONGTEXT NULL DEFAULT NULL,
  `BillingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `BillingCountry` LONGTEXT NULL DEFAULT NULL,
  `BillingLatitude` DOUBLE NULL DEFAULT NULL,
  `BillingLongitude` DOUBLE NULL DEFAULT NULL,
  `BillingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `BillingAddress` LONGTEXT NULL DEFAULT NULL,
  `ShippingStreet` LONGTEXT NULL DEFAULT NULL,
  `ShippingCity` LONGTEXT NULL DEFAULT NULL,
  `ShippingState` LONGTEXT NULL DEFAULT NULL,
  `ShippingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `ShippingCountry` LONGTEXT NULL DEFAULT NULL,
  `ShippingLatitude` DOUBLE NULL DEFAULT NULL,
  `ShippingLongitude` DOUBLE NULL DEFAULT NULL,
  `ShippingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `ShippingAddress` LONGTEXT NULL DEFAULT NULL,
  `ActivatedDate` DATETIME NULL DEFAULT NULL,
  `ActivatedById` LONGTEXT NULL DEFAULT NULL,
  `StatusCode` LONGTEXT NULL DEFAULT NULL,
  `OrderNumber` LONGTEXT NULL DEFAULT NULL,
  `TotalAmount` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `OrderId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `OrderId` LONGTEXT NULL DEFAULT NULL,
  `PricebookEntryId` LONGTEXT NULL DEFAULT NULL,
  `OriginalOrderItemId` LONGTEXT NULL DEFAULT NULL,
  `AvailableQuantity` DOUBLE NULL DEFAULT NULL,
  `Quantity` DOUBLE NULL DEFAULT NULL,
  `UnitPrice` LONGTEXT NULL DEFAULT NULL,
  `ListPrice` LONGTEXT NULL DEFAULT NULL,
  `TotalPrice` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `OrderItemNumber` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderItemFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderItemFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderItemHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderItemHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `OrderItemId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrderShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrderShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OrderId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `OrderAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.OrgWideEmailAddress
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`OrgWideEmailAddress` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Address` LONGTEXT NULL DEFAULT NULL,
  `DisplayName` LONGTEXT NULL DEFAULT NULL,
  `IsAllowAllProfiles` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Organization
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Organization` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Division` LONGTEXT NULL DEFAULT NULL,
  `Street` LONGTEXT NULL DEFAULT NULL,
  `City` LONGTEXT NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `PostalCode` LONGTEXT NULL DEFAULT NULL,
  `Country` LONGTEXT NULL DEFAULT NULL,
  `Latitude` DOUBLE NULL DEFAULT NULL,
  `Longitude` DOUBLE NULL DEFAULT NULL,
  `GeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `Address` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `PrimaryContact` LONGTEXT NULL DEFAULT NULL,
  `DefaultLocaleSidKey` LONGTEXT NULL DEFAULT NULL,
  `LanguageLocaleKey` LONGTEXT NULL DEFAULT NULL,
  `ReceivesInfoEmails` BOOLEAN NULL DEFAULT NULL,
  `ReceivesAdminInfoEmails` BOOLEAN NULL DEFAULT NULL,
  `PreferencesRequireOpportunityProducts` BOOLEAN NULL DEFAULT NULL,
  `FiscalYearStartMonth` INT NULL DEFAULT NULL,
  `UsesStartDateAsFiscalYearName` BOOLEAN NULL DEFAULT NULL,
  `DefaultAccountAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultContactAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultOpportunityAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultLeadAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultCaseAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultCalendarAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultPricebookAccess` LONGTEXT NULL DEFAULT NULL,
  `DefaultCampaignAccess` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ComplianceBccEmail` LONGTEXT NULL DEFAULT NULL,
  `UiSkin` LONGTEXT NULL DEFAULT NULL,
  `SignupCountryIsoCode` LONGTEXT NULL DEFAULT NULL,
  `TrialExpirationDate` DATETIME NULL DEFAULT NULL,
  `OrganizationType` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `InstanceName` LONGTEXT NULL DEFAULT NULL,
  `IsSandbox` BOOLEAN NULL DEFAULT NULL,
  `WebToCaseDefaultOrigin` LONGTEXT NULL DEFAULT NULL,
  `MonthlyPageViewsUsed` INT NULL DEFAULT NULL,
  `MonthlyPageViewsEntitlement` INT NULL DEFAULT NULL,
  `IsReadOnly` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Ownership_History__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Ownership_History__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Acquisition_Date__c` DATE NULL DEFAULT NULL,
  `Attorney_Company__c` LONGTEXT NULL DEFAULT NULL,
  `Attorney__c` LONGTEXT NULL DEFAULT NULL,
  `Coverage_Position__c` LONGTEXT NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Policy_Number__c` LONGTEXT NULL DEFAULT NULL,
  `Property_Owner__c` LONGTEXT NULL DEFAULT NULL,
  `Sold_Date__c` DATE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PackageLicense
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PackageLicense` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `IsProvisioned` BOOLEAN NULL DEFAULT NULL,
  `AllowedLicenses` INT NULL DEFAULT NULL,
  `UsedLicenses` INT NULL DEFAULT NULL,
  `ExpirationDate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Partner
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Partner` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `AccountFromId` LONGTEXT NULL DEFAULT NULL,
  `AccountToId` LONGTEXT NULL DEFAULT NULL,
  `Role` LONGTEXT NULL DEFAULT NULL,
  `IsPrimary` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ReversePartnerId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PartnerRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PartnerRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `ReverseRole` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Period
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Period` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `FiscalYearSettingsId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsForecastPeriod` BOOLEAN NULL DEFAULT NULL,
  `QuarterLabel` LONGTEXT NULL DEFAULT NULL,
  `PeriodLabel` LONGTEXT NULL DEFAULT NULL,
  `Number` INT NULL DEFAULT NULL,
  `FullyQualifiedLabel` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PermissionSet
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PermissionSet` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `LicenseId` LONGTEXT NULL DEFAULT NULL,
  `ProfileId` LONGTEXT NULL DEFAULT NULL,
  `IsOwnedByProfile` BOOLEAN NULL DEFAULT NULL,
  `IsCustom` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailSingle` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailMass` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditTask` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditEvent` BOOLEAN NULL DEFAULT NULL,
  `PermissionsExportReport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportPersonal` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDataExport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditPublicTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModifyAllData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCases` BOOLEAN NULL DEFAULT NULL,
  `PermissionsMassInlineEdit` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSolutions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomizeApplication` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditReadonlyFields` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRunReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewSetup` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyEntity` BOOLEAN NULL DEFAULT NULL,
  `PermissionsNewReportBuilder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsActivateContract` BOOLEAN NULL DEFAULT NULL,
  `PermissionsActivateOrder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyLead` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditPublicDocuments` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewEncryptedData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditBrandTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditHtmlTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterInternalUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDeleteActivatedContract` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterInviteExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSendSitRequests` BOOLEAN NULL DEFAULT NULL,
  `PermissionsOverrideForecasts` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllForecasts` BOOLEAN NULL DEFAULT NULL,
  `PermissionsApiUserOnly` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageRemoteAccess` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanUseNewDashboardBuilder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConvertLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsPasswordNeverExpires` BOOLEAN NULL DEFAULT NULL,
  `PermissionsUseTeamReassignWizards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditActivatedOrders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsInstallPackaging` BOOLEAN NULL DEFAULT NULL,
  `PermissionsPublishPackaging` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterOwnGroups` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditOppLineItemUnitPrice` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreatePackaging` BOOLEAN NULL DEFAULT NULL,
  `PermissionsBulkApiHardDelete` BOOLEAN NULL DEFAULT NULL,
  `PermissionsInboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSolutionImport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCallCenters` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSynonyms` BOOLEAN NULL DEFAULT NULL,
  `PermissionsOutboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewContent` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageEmailClientConfig` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEnableNotifications` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDataIntegrations` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDistributeFromPersWksp` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewDataCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDataCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAuthorApex` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageMobile` BOOLEAN NULL DEFAULT NULL,
  `PermissionsApiEnabled` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCustomReportTypes` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditCaseComments` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyCase` BOOLEAN NULL DEFAULT NULL,
  `PermissionsContentAdministrator` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateWorkspaces` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentPermissions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentProperties` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentTypes` BOOLEAN NULL DEFAULT NULL,
  `PermissionsScheduleJob` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageExchangeConfig` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageAnalyticSnapshots` BOOLEAN NULL DEFAULT NULL,
  `PermissionsScheduleReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageBusinessHourHolidays` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomSidebarOnAllPages` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageInteraction` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewMyTeamsDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModerateChatter` BOOLEAN NULL DEFAULT NULL,
  `PermissionsResetPasswords` BOOLEAN NULL DEFAULT NULL,
  `PermissionsFlowUFLRequired` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanInsertFeedSystemFields` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailTemplateManagement` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailAdministration` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageChatterMessages` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAllowEmailIC` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterFileLink` BOOLEAN NULL DEFAULT NULL,
  `PermissionsForceTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewEventLogFiles` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageNetworks` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewCaseInteraction` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageAuthProviders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRunFlow` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageQuotas` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateDashboardFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewPublicDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDashbdsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateReportFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewPublicReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageReportsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditMyDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditMyReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConnectOrgToEnvironmentHub` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeFilters` BOOLEAN NULL DEFAULT NULL,
  `PermissionsGovernNetworks` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSalesConsole` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTwoFactorApi` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDeleteTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAssignTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsIdentityEnabled` BOOLEAN NULL DEFAULT NULL,
  `PermissionsIdentityConnect` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateWorkBadgeDefinition` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomMobileAppsAccess` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewHelpLink` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageProfilesPermissionsets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAssignPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageRoles` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageIpAddresses` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSharing` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageInternalUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManagePasswordPolicies` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageLoginAccessPolicies` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCustomPermissions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageUnlistedGroups` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsLightningExperienceUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConfigCustomRecs` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSubmitMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `PermissionsBulkMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSessionPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSendAnnouncementEmails` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterEditOwnPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterEditOwnRecordPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportCustomObjects` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDelegatedTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterComposeUiCodesnippet` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSelectFilesFromSalesforce` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModerateNetworkUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsMergeTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSubscribeToLightningReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManagePvtRptsAndDashbds` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCampaignInfluence2` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewDataAssessment` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanApproveFeedPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAllowViewEditConvertedLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSocialInsightsLogoAdmin` BOOLEAN NULL DEFAULT NULL,
  `PermissionsShowCompanyNameAsUserBadge` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAccessCMC` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllActivities` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `HasActivationRequired` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PermissionSetAssignment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PermissionSetAssignment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `PermissionSetId` LONGTEXT NULL DEFAULT NULL,
  `AssigneeId` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PermissionSetLicense
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PermissionSetLicense` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `PermissionSetLicenseKey` LONGTEXT NULL DEFAULT NULL,
  `TotalLicenses` INT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `ExpirationDate` DATE NULL DEFAULT NULL,
  `MaximumPermissionsEmailSingle` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEmailMass` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditTask` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditEvent` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsExportReport` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsImportPersonal` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsDataExport` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageUsers` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditPublicTemplates` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsModifyAllData` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageCases` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsMassInlineEdit` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageSolutions` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCustomizeApplication` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditReadonlyFields` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsRunReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewSetup` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsTransferAnyEntity` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsNewReportBuilder` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsActivateContract` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsActivateOrder` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsImportLeads` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageLeads` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsTransferAnyLead` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewAllData` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditPublicDocuments` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewEncryptedData` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditBrandTemplates` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditHtmlTemplates` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterInternalUser` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsDeleteActivatedContract` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterInviteExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSendSitRequests` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsOverrideForecasts` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewAllForecasts` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsApiUserOnly` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageRemoteAccess` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCanUseNewDashboardBuilder` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageCategories` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsConvertLeads` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsPasswordNeverExpires` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsUseTeamReassignWizards` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditActivatedOrders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsInstallPackaging` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsPublishPackaging` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterOwnGroups` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditOppLineItemUnitPrice` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreatePackaging` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsBulkApiHardDelete` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsInboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSolutionImport` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageCallCenters` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageSynonyms` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsOutboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewContent` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageEmailClientConfig` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEnableNotifications` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageDataIntegrations` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsDistributeFromPersWksp` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewDataCategories` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageDataCategories` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAuthorApex` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageMobile` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsApiEnabled` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageCustomReportTypes` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditCaseComments` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsTransferAnyCase` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsContentAdministrator` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateWorkspaces` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageContentPermissions` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageContentProperties` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageContentTypes` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsScheduleJob` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageExchangeConfig` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageAnalyticSnapshots` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsScheduleReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageBusinessHourHolidays` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCustomSidebarOnAllPages` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageInteraction` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewMyTeamsDashboards` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsModerateChatter` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsResetPasswords` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsFlowUFLRequired` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCanInsertFeedSystemFields` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEmailTemplateManagement` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEmailAdministration` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageChatterMessages` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAllowEmailIC` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterFileLink` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsForceTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewEventLogFiles` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageNetworks` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewCaseInteraction` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageAuthProviders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsRunFlow` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageQuotas` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateCustomizeDashboards` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateDashboardFolders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewPublicDashboards` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageDashbdsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateCustomizeReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateReportFolders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewPublicReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageReportsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditMyDashboards` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditMyReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewAllUsers` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsConnectOrgToEnvironmentHub` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateCustomizeFilters` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsGovernNetworks` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSalesConsole` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsTwoFactorApi` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsDeleteTopics` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsEditTopics` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateTopics` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAssignTopics` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsIdentityEnabled` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsIdentityConnect` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCreateWorkBadgeDefinition` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCustomMobileAppsAccess` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewHelpLink` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageProfilesPermissionsets` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAssignPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageRoles` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageIpAddresses` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageSharing` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageInternalUsers` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManagePasswordPolicies` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageLoginAccessPolicies` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageCustomPermissions` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageUnlistedGroups` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsLightningExperienceUser` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsConfigCustomRecs` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSubmitMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsBulkMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageSessionPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSendAnnouncementEmails` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterEditOwnPost` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterEditOwnRecordPost` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsImportCustomObjects` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsDelegatedTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsChatterComposeUiCodesnippet` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSelectFilesFromSalesforce` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsModerateNetworkUsers` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsMergeTopics` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSubscribeToLightningReports` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManagePvtRptsAndDashbds` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCampaignInfluence2` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewDataAssessment` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsCanApproveFeedPost` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAllowViewEditConvertedLeads` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsSocialInsightsLogoAdmin` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsShowCompanyNameAsUserBadge` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsAccessCMC` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsManageHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `MaximumPermissionsViewAllActivities` BOOLEAN NULL DEFAULT NULL,
  `UsedLicenses` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PermissionSetLicenseAssign
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PermissionSetLicenseAssign` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `PermissionSetLicenseId` LONGTEXT NULL DEFAULT NULL,
  `AssigneeId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PlatformCachePartition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PlatformCachePartition` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsDefaultPartition` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PlatformCachePartitionType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PlatformCachePartitionType` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `PlatformCachePartitionId` LONGTEXT NULL DEFAULT NULL,
  `CacheType` LONGTEXT NULL DEFAULT NULL,
  `AllocatedCapacity` INT NULL DEFAULT NULL,
  `AllocatedPurchasedCapacity` INT NULL DEFAULT NULL,
  `AllocatedTrialCapacity` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Pricebook2
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Pricebook2` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsStandard` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Pricebook2History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Pricebook2History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PricebookEntry
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PricebookEntry` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `UnitPrice` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `UseStandardPrice` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ProductCode` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessDefinition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessDefinition` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `TableEnumOrId` LONGTEXT NULL DEFAULT NULL,
  `LockType` LONGTEXT NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessInstance
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessInstance` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ProcessDefinitionId` LONGTEXT NULL DEFAULT NULL,
  `TargetObjectId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `CompletedDate` DATETIME NULL DEFAULT NULL,
  `LastActorId` LONGTEXT NULL DEFAULT NULL,
  `ElapsedTimeInDays` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInHours` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInMinutes` DOUBLE NULL DEFAULT NULL,
  `SubmittedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessInstanceNode
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessInstanceNode` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ProcessInstanceId` LONGTEXT NULL DEFAULT NULL,
  `ProcessNodeId` LONGTEXT NULL DEFAULT NULL,
  `NodeStatus` LONGTEXT NULL DEFAULT NULL,
  `CompletedDate` DATETIME NULL DEFAULT NULL,
  `LastActorId` LONGTEXT NULL DEFAULT NULL,
  `ProcessNodeName` LONGTEXT NULL DEFAULT NULL,
  `ElapsedTimeInDays` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInHours` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInMinutes` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessInstanceStep
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessInstanceStep` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ProcessInstanceId` LONGTEXT NULL DEFAULT NULL,
  `StepStatus` LONGTEXT NULL DEFAULT NULL,
  `OriginalActorId` LONGTEXT NULL DEFAULT NULL,
  `ActorId` LONGTEXT NULL DEFAULT NULL,
  `Comments` LONGTEXT NULL DEFAULT NULL,
  `StepNodeId` LONGTEXT NULL DEFAULT NULL,
  `ElapsedTimeInDays` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInHours` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInMinutes` DOUBLE NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessInstanceWorkitem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessInstanceWorkitem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ProcessInstanceId` LONGTEXT NULL DEFAULT NULL,
  `OriginalActorId` LONGTEXT NULL DEFAULT NULL,
  `ActorId` LONGTEXT NULL DEFAULT NULL,
  `ElapsedTimeInDays` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInHours` DOUBLE NULL DEFAULT NULL,
  `ElapsedTimeInMinutes` DOUBLE NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProcessNode
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProcessNode` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `ProcessDefinitionId` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Product2
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Product2` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ProductCode` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Family` LONGTEXT NULL DEFAULT NULL,
  `ExternalDataSourceId` LONGTEXT NULL DEFAULT NULL,
  `ExternalId` LONGTEXT NULL DEFAULT NULL,
  `DisplayUrl` LONGTEXT NULL DEFAULT NULL,
  `QuantityUnitOfMeasure` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Product2Feed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Product2Feed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Product2History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Product2History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Profile
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Profile` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `PermissionsEmailSingle` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailMass` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditTask` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditEvent` BOOLEAN NULL DEFAULT NULL,
  `PermissionsExportReport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportPersonal` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDataExport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditPublicTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModifyAllData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCases` BOOLEAN NULL DEFAULT NULL,
  `PermissionsMassInlineEdit` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSolutions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomizeApplication` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditReadonlyFields` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRunReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewSetup` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyEntity` BOOLEAN NULL DEFAULT NULL,
  `PermissionsNewReportBuilder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsActivateContract` BOOLEAN NULL DEFAULT NULL,
  `PermissionsActivateOrder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyLead` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditPublicDocuments` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewEncryptedData` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditBrandTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditHtmlTemplates` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterInternalUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDeleteActivatedContract` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterInviteExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSendSitRequests` BOOLEAN NULL DEFAULT NULL,
  `PermissionsOverrideForecasts` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllForecasts` BOOLEAN NULL DEFAULT NULL,
  `PermissionsApiUserOnly` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageRemoteAccess` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanUseNewDashboardBuilder` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConvertLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsPasswordNeverExpires` BOOLEAN NULL DEFAULT NULL,
  `PermissionsUseTeamReassignWizards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditActivatedOrders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsInstallMultiforce` BOOLEAN NULL DEFAULT NULL,
  `PermissionsPublishMultiforce` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterOwnGroups` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditOppLineItemUnitPrice` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateMultiforce` BOOLEAN NULL DEFAULT NULL,
  `PermissionsBulkApiHardDelete` BOOLEAN NULL DEFAULT NULL,
  `PermissionsInboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSolutionImport` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCallCenters` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSynonyms` BOOLEAN NULL DEFAULT NULL,
  `PermissionsOutboundMigrationToolsUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewContent` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageEmailClientConfig` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEnableNotifications` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDataIntegrations` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDistributeFromPersWksp` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewDataCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDataCategories` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAuthorApex` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageMobile` BOOLEAN NULL DEFAULT NULL,
  `PermissionsApiEnabled` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCustomReportTypes` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditCaseComments` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTransferAnyCase` BOOLEAN NULL DEFAULT NULL,
  `PermissionsContentAdministrator` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateWorkspaces` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentPermissions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentProperties` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageContentTypes` BOOLEAN NULL DEFAULT NULL,
  `PermissionsScheduleJob` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageExchangeConfig` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageAnalyticSnapshots` BOOLEAN NULL DEFAULT NULL,
  `PermissionsScheduleReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageBusinessHourHolidays` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomSidebarOnAllPages` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageInteraction` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewMyTeamsDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModerateChatter` BOOLEAN NULL DEFAULT NULL,
  `PermissionsResetPasswords` BOOLEAN NULL DEFAULT NULL,
  `PermissionsFlowUFLRequired` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanInsertFeedSystemFields` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailTemplateManagement` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEmailAdministration` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageChatterMessages` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAllowEmailIC` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterFileLink` BOOLEAN NULL DEFAULT NULL,
  `PermissionsForceTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewEventLogFiles` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageNetworks` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewCaseInteraction` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageAuthProviders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsRunFlow` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageQuotas` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateDashboardFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewPublicDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageDashbdsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateReportFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewPublicReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageReportsInPubFolders` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditMyDashboards` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditMyReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConnectOrgToEnvironmentHub` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateCustomizeFilters` BOOLEAN NULL DEFAULT NULL,
  `PermissionsGovernNetworks` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSalesConsole` BOOLEAN NULL DEFAULT NULL,
  `PermissionsTwoFactorApi` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDeleteTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsEditTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAssignTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsIdentityEnabled` BOOLEAN NULL DEFAULT NULL,
  `PermissionsIdentityConnect` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCreateWorkBadgeDefinition` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCustomMobileAppsAccess` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewHelpLink` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageProfilesPermissionsets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAssignPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageRoles` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageIpAddresses` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSharing` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageInternalUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManagePasswordPolicies` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageLoginAccessPolicies` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageCustomPermissions` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageUnlistedGroups` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsLightningExperienceUser` BOOLEAN NULL DEFAULT NULL,
  `PermissionsConfigCustomRecs` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSubmitMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `PermissionsBulkMacrosAllowed` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageSessionPermissionSets` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSendAnnouncementEmails` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterEditOwnPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterEditOwnRecordPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsImportCustomObjects` BOOLEAN NULL DEFAULT NULL,
  `PermissionsDelegatedTwoFactor` BOOLEAN NULL DEFAULT NULL,
  `PermissionsChatterComposeUiCodesnippet` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSelectFilesFromSalesforce` BOOLEAN NULL DEFAULT NULL,
  `PermissionsModerateNetworkUsers` BOOLEAN NULL DEFAULT NULL,
  `PermissionsMergeTopics` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSubscribeToLightningReports` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManagePvtRptsAndDashbds` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCampaignInfluence2` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewDataAssessment` BOOLEAN NULL DEFAULT NULL,
  `PermissionsCanApproveFeedPost` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAllowViewEditConvertedLeads` BOOLEAN NULL DEFAULT NULL,
  `PermissionsSocialInsightsLogoAdmin` BOOLEAN NULL DEFAULT NULL,
  `PermissionsShowCompanyNameAsUserBadge` BOOLEAN NULL DEFAULT NULL,
  `PermissionsAccessCMC` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `PermissionsManageHealthCheck` BOOLEAN NULL DEFAULT NULL,
  `PermissionsViewAllActivities` BOOLEAN NULL DEFAULT NULL,
  `UserLicenseId` LONGTEXT NULL DEFAULT NULL,
  `UserType` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkill
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkill` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `UserCount` INT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillEndorsement
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillEndorsement` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ProfileSkillUserId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillEndorsementFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillEndorsementFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillEndorsementHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillEndorsementHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ProfileSkillEndorsementId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ProfileSkillId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillUser
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillUser` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ProfileSkillId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `EndorsementCount` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillUserFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillUserFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ProfileSkillUserHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ProfileSkillUserHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ProfileSkillUserId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Publisher
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Publisher` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `DurableId` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `IsSalesforce` BOOLEAN NULL DEFAULT NULL,
  `MajorVersion` INT NULL DEFAULT NULL,
  `MinorVersion` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.PushTopic
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`PushTopic` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Query` LONGTEXT NULL DEFAULT NULL,
  `ApiVersion` DOUBLE NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `NotifyForFields` LONGTEXT NULL DEFAULT NULL,
  `NotifyForOperations` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `NotifyForOperationCreate` BOOLEAN NULL DEFAULT NULL,
  `NotifyForOperationUpdate` BOOLEAN NULL DEFAULT NULL,
  `NotifyForOperationDelete` BOOLEAN NULL DEFAULT NULL,
  `NotifyForOperationUndelete` BOOLEAN NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QueueSobject
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QueueSobject` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `QueueId` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuickText
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuickText` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Message` LONGTEXT NULL DEFAULT NULL,
  `Category` LONGTEXT NULL DEFAULT NULL,
  `Channel` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuickTextHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuickTextHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `QuickTextId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuickTextShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuickTextShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Quote
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Quote` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `OpportunityId` LONGTEXT NULL DEFAULT NULL,
  `Pricebook2Id` LONGTEXT NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `QuoteNumber` LONGTEXT NULL DEFAULT NULL,
  `IsSyncing` BOOLEAN NULL DEFAULT NULL,
  `ShippingHandling` LONGTEXT NULL DEFAULT NULL,
  `Tax` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `ExpirationDate` DATE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Subtotal` LONGTEXT NULL DEFAULT NULL,
  `TotalPrice` LONGTEXT NULL DEFAULT NULL,
  `LineItemCount` INT NULL DEFAULT NULL,
  `BillingStreet` LONGTEXT NULL DEFAULT NULL,
  `BillingCity` LONGTEXT NULL DEFAULT NULL,
  `BillingState` LONGTEXT NULL DEFAULT NULL,
  `BillingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `BillingCountry` LONGTEXT NULL DEFAULT NULL,
  `BillingLatitude` DOUBLE NULL DEFAULT NULL,
  `BillingLongitude` DOUBLE NULL DEFAULT NULL,
  `BillingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `BillingAddress` LONGTEXT NULL DEFAULT NULL,
  `ShippingStreet` LONGTEXT NULL DEFAULT NULL,
  `ShippingCity` LONGTEXT NULL DEFAULT NULL,
  `ShippingState` LONGTEXT NULL DEFAULT NULL,
  `ShippingPostalCode` LONGTEXT NULL DEFAULT NULL,
  `ShippingCountry` LONGTEXT NULL DEFAULT NULL,
  `ShippingLatitude` DOUBLE NULL DEFAULT NULL,
  `ShippingLongitude` DOUBLE NULL DEFAULT NULL,
  `ShippingGeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `ShippingAddress` LONGTEXT NULL DEFAULT NULL,
  `BillingName` LONGTEXT NULL DEFAULT NULL,
  `ShippingName` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `Discount` DOUBLE NULL DEFAULT NULL,
  `GrandTotal` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuoteDocument
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuoteDocument` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `QuoteId` LONGTEXT NULL DEFAULT NULL,
  `ContentVersionDocumentId` LONGTEXT NULL DEFAULT NULL,
  `Document` LONGTEXT NULL DEFAULT NULL,
  `GrandTotal` LONGTEXT NULL DEFAULT NULL,
  `Discount` DOUBLE NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuoteFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuoteFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuoteLineItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuoteLineItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LineNumber` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `QuoteId` LONGTEXT NULL DEFAULT NULL,
  `PricebookEntryId` LONGTEXT NULL DEFAULT NULL,
  `Quantity` DOUBLE NULL DEFAULT NULL,
  `UnitPrice` LONGTEXT NULL DEFAULT NULL,
  `Discount` DOUBLE NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Product2Id` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `ListPrice` LONGTEXT NULL DEFAULT NULL,
  `Subtotal` LONGTEXT NULL DEFAULT NULL,
  `TotalPrice` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.QuoteShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`QuoteShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.RecentlyViewed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`RecentlyViewed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `LastName` LONGTEXT NULL DEFAULT NULL,
  `FirstName` LONGTEXT NULL DEFAULT NULL,
  `MiddleName` LONGTEXT NULL DEFAULT NULL,
  `Suffix` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `Alias` LONGTEXT NULL DEFAULT NULL,
  `UserRoleId` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `ProfileId` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `NameOrAlias` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.RecordType
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`RecordType` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `BusinessProcessId` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Region_Configurations__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Region_Configurations__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IDEM_Inspector__c` LONGTEXT NULL DEFAULT NULL,
  `County__c` LONGTEXT NULL DEFAULT NULL,
  `Region_code__c` DOUBLE NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Company_Manager__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Regulatory_Record__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Regulatory_Record__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Regulatory_Record__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Regulatory_Record__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Date__c` DATE NULL DEFAULT NULL,
  `Document_Link__c` LONGTEXT NULL DEFAULT NULL,
  `Document_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Active__c` BOOLEAN NULL DEFAULT NULL,
  `Last_Update__c` DATE NULL DEFAULT NULL,
  `Scope_of_Work__c` LONGTEXT NULL DEFAULT NULL,
  `State_Program__c` LONGTEXT NULL DEFAULT NULL,
  `Lead__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Report
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Report` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `FolderName` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `LastRunDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Format` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ReportFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ReportFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Requirements__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Requirements__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Requirements__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Requirements__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Related_to__c` LONGTEXT NULL DEFAULT NULL,
  `Req_Title__c` LONGTEXT NULL DEFAULT NULL,
  `Req_Description__c` LONGTEXT NULL DEFAULT NULL,
  `Phase__c` LONGTEXT NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL,
  `Work_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Assigned_to__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SAML_Service_Provider__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SAML_Service_Provider__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ACS_URL__c` LONGTEXT NULL DEFAULT NULL,
  `CertificateName__c` LONGTEXT NULL DEFAULT NULL,
  `Entity_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Issuer__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Sales_Lead__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Sales_Lead__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Sales_Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Owner_Type__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Incident__c` LONGTEXT NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL,
  `Remediation_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Lead_Type__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SamlSsoConfig
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SamlSsoConfig` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Version` LONGTEXT NULL DEFAULT NULL,
  `Issuer` LONGTEXT NULL DEFAULT NULL,
  `OptionsSpInitBinding` BOOLEAN NULL DEFAULT NULL,
  `OptionsUserProvisioning` BOOLEAN NULL DEFAULT NULL,
  `AttributeFormat` LONGTEXT NULL DEFAULT NULL,
  `AttributeName` LONGTEXT NULL DEFAULT NULL,
  `Audience` LONGTEXT NULL DEFAULT NULL,
  `IdentityMapping` LONGTEXT NULL DEFAULT NULL,
  `IdentityLocation` LONGTEXT NULL DEFAULT NULL,
  `SamlJitHandlerId` LONGTEXT NULL DEFAULT NULL,
  `ExecutionUserId` LONGTEXT NULL DEFAULT NULL,
  `LoginUrl` LONGTEXT NULL DEFAULT NULL,
  `LogoutUrl` LONGTEXT NULL DEFAULT NULL,
  `ErrorUrl` LONGTEXT NULL DEFAULT NULL,
  `ValidationCert` LONGTEXT NULL DEFAULT NULL,
  `RequestSignatureMethod` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Scontrol
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Scontrol` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `EncodingKey` LONGTEXT NULL DEFAULT NULL,
  `HtmlWrapper` LONGTEXT NULL DEFAULT NULL,
  `Filename` LONGTEXT NULL DEFAULT NULL,
  `BodyLength` INT NULL DEFAULT NULL,
  `Binary` LONGTEXT NULL DEFAULT NULL,
  `ContentSource` LONGTEXT NULL DEFAULT NULL,
  `SupportsCaching` BOOLEAN NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SearchActivity
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SearchActivity` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `SearchTerm` LONGTEXT NULL DEFAULT NULL,
  `QueryDate` DATE NULL DEFAULT NULL,
  `CountQueries` INT NULL DEFAULT NULL,
  `CountUsers` INT NULL DEFAULT NULL,
  `AvgNumResults` DOUBLE NULL DEFAULT NULL,
  `KbChannel` LONGTEXT NULL DEFAULT NULL,
  `Period` LONGTEXT NULL DEFAULT NULL,
  `ClickRank` DOUBLE NULL DEFAULT NULL,
  `QueryLanguage` LONGTEXT NULL DEFAULT NULL,
  `ClickedRecordName` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SecureAgentsCluster
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SecureAgentsCluster` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SecurityCustomBaseline
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SecurityCustomBaseline` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `Language` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Baseline` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SessionPermSetActivation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SessionPermSetActivation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `AuthSessionId` LONGTEXT NULL DEFAULT NULL,
  `PermissionSetId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SetupAuditTrail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SetupAuditTrail` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Action` LONGTEXT NULL DEFAULT NULL,
  `Section` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `Display` LONGTEXT NULL DEFAULT NULL,
  `DelegateUser` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SetupEntityAccess
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SetupEntityAccess` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `SetupEntityId` LONGTEXT NULL DEFAULT NULL,
  `SetupEntityType` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Signup_History__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Signup_History__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Amount_Paid__c` LONGTEXT NULL DEFAULT NULL,
  `Sales_Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Subscription_End_Date__c` DATE NULL DEFAULT NULL,
  `Subscription_Start_Date__c` DATE NULL DEFAULT NULL,
  `Subscription_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Active__c` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Site
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Site` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Subdomain` LONGTEXT NULL DEFAULT NULL,
  `UrlPathPrefix` LONGTEXT NULL DEFAULT NULL,
  `GuestUserId` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `AdminId` LONGTEXT NULL DEFAULT NULL,
  `OptionsEnableFeeds` BOOLEAN NULL DEFAULT NULL,
  `OptionsRequireHttps` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowHomePage` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowStandardIdeasPages` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowStandardSearch` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowStandardLookups` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowStandardAnswersPages` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowGuestSupportApi` BOOLEAN NULL DEFAULT NULL,
  `OptionsAllowStandardPortalPages` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `AnalyticsTrackingCode` LONGTEXT NULL DEFAULT NULL,
  `SiteType` LONGTEXT NULL DEFAULT NULL,
  `ClickjackProtectionLevel` LONGTEXT NULL DEFAULT NULL,
  `DailyBandwidthLimit` INT NULL DEFAULT NULL,
  `DailyBandwidthUsed` INT NULL DEFAULT NULL,
  `DailyRequestTimeLimit` INT NULL DEFAULT NULL,
  `DailyRequestTimeUsed` INT NULL DEFAULT NULL,
  `MonthlyPageViewsEntitlement` INT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SiteFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SiteFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SiteHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SiteHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SiteId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Site_Report__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Site_Report__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Site_Testing__c` LONGTEXT NULL DEFAULT NULL,
  `Attachment__c` LONGTEXT NULL DEFAULT NULL,
  `Description__c` LONGTEXT NULL DEFAULT NULL,
  `File_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `View__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Site_Testing__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Site_Testing__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `Approval_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `Next_Test_Date__c` DATE NULL DEFAULT NULL,
  `Site_Tester_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Submit_for_approval__c` BOOLEAN NULL DEFAULT NULL,
  `Test_Date__c` DATE NULL DEFAULT NULL,
  `Test_Report_Attached__c` BOOLEAN NULL DEFAULT NULL,
  `Test_Scheduled_Date__c` DATE NULL DEFAULT NULL,
  `Tester_name__c` LONGTEXT NULL DEFAULT NULL,
  `Testing_Status__c` LONGTEXT NULL DEFAULT NULL,
  `Testing_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Testing_Vendor__c` LONGTEXT NULL DEFAULT NULL,
  `Payee__c` LONGTEXT NULL DEFAULT NULL,
  `Duration_of_the_Project__c` LONGTEXT NULL DEFAULT NULL,
  `Test_Coordinator__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Solution
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Solution` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SolutionNumber` LONGTEXT NULL DEFAULT NULL,
  `SolutionName` LONGTEXT NULL DEFAULT NULL,
  `IsPublished` BOOLEAN NULL DEFAULT NULL,
  `IsPublishedInPublicKb` BOOLEAN NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `IsReviewed` BOOLEAN NULL DEFAULT NULL,
  `SolutionNote` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `TimesUsed` INT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `IsHtml` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SolutionFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SolutionFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SolutionHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SolutionHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SolutionId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.SolutionStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`SolutionStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `IsReviewed` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Stamp
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Stamp` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.StampAssignment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`StampAssignment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `StampId` LONGTEXT NULL DEFAULT NULL,
  `SubjectId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.StaticResource
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`StaticResource` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ContentType` LONGTEXT NULL DEFAULT NULL,
  `BodyLength` INT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CacheControl` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.StreamingChannel
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`StreamingChannel` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `IsDynamic` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.StreamingChannelShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`StreamingChannelShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Student__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Student__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Apt_No__c` LONGTEXT NULL DEFAULT NULL,
  `Street_Address__c` LONGTEXT NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `PostalCode__c` LONGTEXT NULL DEFAULT NULL,
  `Country__c` LONGTEXT NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL,
  `Location__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Support_Incidents__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Support_Incidents__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Support_Incidents__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Support_Incidents__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `RecordTypeId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Related_To__c` LONGTEXT NULL DEFAULT NULL,
  `Issue_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Issue_Title__c` LONGTEXT NULL DEFAULT NULL,
  `Short_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL,
  `Work_Notes__c` LONGTEXT NULL DEFAULT NULL,
  `Assigned_to__c` LONGTEXT NULL DEFAULT NULL,
  `Resolution_Comments__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TankAlarmHistory__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TankAlarmHistory__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `RunDate__c` DATETIME NULL DEFAULT NULL,
  `TANK__c` LONGTEXT NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `AlarmType__c` LONGTEXT NULL DEFAULT NULL,
  `OccuredDate__c` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TankStatusReport__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TankStatusReport__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Facility__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `RunDate__c` DATETIME NULL DEFAULT NULL,
  `Tank__c` LONGTEXT NULL DEFAULT NULL,
  `Product__c` LONGTEXT NULL DEFAULT NULL,
  `Status__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Task
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Task` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `WhoId` LONGTEXT NULL DEFAULT NULL,
  `WhatId` LONGTEXT NULL DEFAULT NULL,
  `WhoCount` INT NULL DEFAULT NULL,
  `WhatCount` INT NULL DEFAULT NULL,
  `Subject` LONGTEXT NULL DEFAULT NULL,
  `ActivityDate` DATE NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `Priority` LONGTEXT NULL DEFAULT NULL,
  `IsHighPriority` BOOLEAN NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsArchived` BOOLEAN NULL DEFAULT NULL,
  `CallDurationInSeconds` INT NULL DEFAULT NULL,
  `CallType` LONGTEXT NULL DEFAULT NULL,
  `CallDisposition` LONGTEXT NULL DEFAULT NULL,
  `CallObject` LONGTEXT NULL DEFAULT NULL,
  `ReminderDateTime` DATETIME NULL DEFAULT NULL,
  `IsReminderSet` BOOLEAN NULL DEFAULT NULL,
  `RecurrenceActivityId` LONGTEXT NULL DEFAULT NULL,
  `IsRecurrence` BOOLEAN NULL DEFAULT NULL,
  `RecurrenceStartDateOnly` DATE NULL DEFAULT NULL,
  `RecurrenceEndDateOnly` DATE NULL DEFAULT NULL,
  `RecurrenceTimeZoneSidKey` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceType` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceInterval` INT NULL DEFAULT NULL,
  `RecurrenceDayOfWeekMask` INT NULL DEFAULT NULL,
  `RecurrenceDayOfMonth` INT NULL DEFAULT NULL,
  `RecurrenceInstance` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceMonthOfYear` LONGTEXT NULL DEFAULT NULL,
  `RecurrenceRegeneratedType` LONGTEXT NULL DEFAULT NULL,
  `TaskSubtype` LONGTEXT NULL DEFAULT NULL,
  `Assigned_to_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `ELTF__c` DOUBLE NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `LUST_Last_Update__c` DATE NULL DEFAULT NULL,
  `UST_Last_Update__c` DATE NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TaskFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TaskFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TaskPriority
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TaskPriority` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `IsHighPriority` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TaskRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TaskRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `TaskId` LONGTEXT NULL DEFAULT NULL,
  `IsWhat` BOOLEAN NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TaskStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TaskStatus` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `ApiName` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `IsDefault` BOOLEAN NULL DEFAULT NULL,
  `IsClosed` BOOLEAN NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TaskWhoRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TaskWhoRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `TaskId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TenantUsageEntitlement
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TenantUsageEntitlement` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ResourceGroupKey` LONGTEXT NULL DEFAULT NULL,
  `Setting` LONGTEXT NULL DEFAULT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `EndDate` DATE NULL DEFAULT NULL,
  `CurrentAmountAllowed` DOUBLE NULL DEFAULT NULL,
  `Frequency` LONGTEXT NULL DEFAULT NULL,
  `IsPersistentResource` BOOLEAN NULL DEFAULT NULL,
  `HasRollover` BOOLEAN NULL DEFAULT NULL,
  `OverageGrace` DOUBLE NULL DEFAULT NULL,
  `AmountUsed` DOUBLE NULL DEFAULT NULL,
  `UsageDate` DATETIME NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TestSuiteMembership
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TestSuiteMembership` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApexTestSuiteId` LONGTEXT NULL DEFAULT NULL,
  `ApexClassId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.ThirdPartyAccountLink
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`ThirdPartyAccountLink` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ThirdPartyAccountLinkKey` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `SsoProviderId` LONGTEXT NULL DEFAULT NULL,
  `Handle` LONGTEXT NULL DEFAULT NULL,
  `RemoteIdentifier` LONGTEXT NULL DEFAULT NULL,
  `Provider` LONGTEXT NULL DEFAULT NULL,
  `SsoProviderName` LONGTEXT NULL DEFAULT NULL,
  `IsNotSsoUsable` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Time_Sheet__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Time_Sheet__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Resource__c` LONGTEXT NULL DEFAULT NULL,
  `Date__c` DATE NULL DEFAULT NULL,
  `No_Of_hours__c` DOUBLE NULL DEFAULT NULL,
  `Type__c` LONGTEXT NULL DEFAULT NULL,
  `Notes__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TodayGoal
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TodayGoal` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TodayGoalShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TodayGoalShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Topic
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Topic` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `TalkingAbout` INT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TopicAssignment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TopicAssignment` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `TopicId` LONGTEXT NULL DEFAULT NULL,
  `EntityId` LONGTEXT NULL DEFAULT NULL,
  `EntityKeyPrefix` LONGTEXT NULL DEFAULT NULL,
  `EntityType` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.TopicFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`TopicFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.USSBOA_Vendor__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`USSBOA_Vendor__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `Vendor_Name__c` LONGTEXT NULL DEFAULT NULL,
  `Street_Address__c` LONGTEXT NULL DEFAULT NULL,
  `City__c` LONGTEXT NULL DEFAULT NULL,
  `State__c` LONGTEXT NULL DEFAULT NULL,
  `Contact_Person__c` LONGTEXT NULL DEFAULT NULL,
  `Phone__c` LONGTEXT NULL DEFAULT NULL,
  `Email__c` LONGTEXT NULL DEFAULT NULL,
  `Postal_Code__c` LONGTEXT NULL DEFAULT NULL,
  `Is_Active__c` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UndecidedEventRelation
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UndecidedEventRelation` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `RelationId` LONGTEXT NULL DEFAULT NULL,
  `EventId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `RespondedDate` DATETIME NULL DEFAULT NULL,
  `Response` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.User
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`User` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Username` LONGTEXT NULL DEFAULT NULL,
  `LastName` LONGTEXT NULL DEFAULT NULL,
  `FirstName` LONGTEXT NULL DEFAULT NULL,
  `MiddleName` LONGTEXT NULL DEFAULT NULL,
  `Suffix` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CompanyName` LONGTEXT NULL DEFAULT NULL,
  `Division` LONGTEXT NULL DEFAULT NULL,
  `Department` LONGTEXT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Street` LONGTEXT NULL DEFAULT NULL,
  `City` LONGTEXT NULL DEFAULT NULL,
  `State` LONGTEXT NULL DEFAULT NULL,
  `PostalCode` LONGTEXT NULL DEFAULT NULL,
  `Country` LONGTEXT NULL DEFAULT NULL,
  `Latitude` DOUBLE NULL DEFAULT NULL,
  `Longitude` DOUBLE NULL DEFAULT NULL,
  `GeocodeAccuracy` LONGTEXT NULL DEFAULT NULL,
  `Address` LONGTEXT NULL DEFAULT NULL,
  `Email` LONGTEXT NULL DEFAULT NULL,
  `EmailPreferencesAutoBcc` BOOLEAN NULL DEFAULT NULL,
  `EmailPreferencesAutoBccStayInTouch` BOOLEAN NULL DEFAULT NULL,
  `EmailPreferencesStayInTouchReminder` BOOLEAN NULL DEFAULT NULL,
  `SenderEmail` LONGTEXT NULL DEFAULT NULL,
  `SenderName` LONGTEXT NULL DEFAULT NULL,
  `Signature` LONGTEXT NULL DEFAULT NULL,
  `StayInTouchSubject` LONGTEXT NULL DEFAULT NULL,
  `StayInTouchSignature` LONGTEXT NULL DEFAULT NULL,
  `StayInTouchNote` LONGTEXT NULL DEFAULT NULL,
  `Phone` LONGTEXT NULL DEFAULT NULL,
  `Fax` LONGTEXT NULL DEFAULT NULL,
  `MobilePhone` LONGTEXT NULL DEFAULT NULL,
  `Alias` LONGTEXT NULL DEFAULT NULL,
  `CommunityNickname` LONGTEXT NULL DEFAULT NULL,
  `BadgeText` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `TimeZoneSidKey` LONGTEXT NULL DEFAULT NULL,
  `UserRoleId` LONGTEXT NULL DEFAULT NULL,
  `LocaleSidKey` LONGTEXT NULL DEFAULT NULL,
  `ReceivesInfoEmails` BOOLEAN NULL DEFAULT NULL,
  `ReceivesAdminInfoEmails` BOOLEAN NULL DEFAULT NULL,
  `EmailEncodingKey` LONGTEXT NULL DEFAULT NULL,
  `ProfileId` LONGTEXT NULL DEFAULT NULL,
  `UserType` LONGTEXT NULL DEFAULT NULL,
  `LanguageLocaleKey` LONGTEXT NULL DEFAULT NULL,
  `EmployeeNumber` LONGTEXT NULL DEFAULT NULL,
  `DelegatedApproverId` LONGTEXT NULL DEFAULT NULL,
  `ManagerId` LONGTEXT NULL DEFAULT NULL,
  `LastLoginDate` DATETIME NULL DEFAULT NULL,
  `LastPasswordChangeDate` DATETIME NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `OfflineTrialExpirationDate` DATETIME NULL DEFAULT NULL,
  `OfflinePdaTrialExpirationDate` DATETIME NULL DEFAULT NULL,
  `UserPermissionsMarketingUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsOfflineUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsAvantgoUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsCallCenterAutoLogin` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsMobileUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsSFContentUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsInteractionUser` BOOLEAN NULL DEFAULT NULL,
  `UserPermissionsSupportUser` BOOLEAN NULL DEFAULT NULL,
  `ForecastEnabled` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesActivityRemindersPopup` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesEventRemindersCheckboxDefault` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesTaskRemindersCheckboxDefault` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesReminderSoundOff` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableAllFeedsEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableFollowersEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableProfilePostEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableChangeCommentEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableLaterCommentEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisProfPostCommentEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesApexPagesDeveloperMode` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideCSNGetChatterMobileTask` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableMentionsPostEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisMentionsCommentEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideCSNDesktopTask` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideChatterOnboardingSplash` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideSecondChatterOnboardingSplash` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisCommentAfterLikeEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableLikeEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesSortFeedByComment` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableMessageEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableBookmarkEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableSharePostEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesEnableAutoSubForFeeds` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableFileShareNotificationsForApi` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowTitleToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowManagerToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowEmailToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowWorkPhoneToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowMobilePhoneToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowFaxToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowStreetAddressToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowCityToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowStateToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowPostalCodeToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowCountryToExternalUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowProfilePicToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowTitleToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowCityToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowStateToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowPostalCodeToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowCountryToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideS1BrowserUI` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesDisableEndorsementEmail` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesPathAssistantCollapsed` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesCacheDiagnostics` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowEmailToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowManagerToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowWorkPhoneToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowMobilePhoneToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowFaxToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesShowStreetAddressToGuestUsers` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesLightningExperiencePreferred` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesPreviewLightning` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideEndUserOnboardingAssistantModal` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideLightningMigrationModal` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideSfxWelcomeMat` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesHideBiggerPhotoCallout` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesGlobalNavBarWTShown` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesGlobalNavGridMenuWTShown` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesCreateLEXAppsWTShown` BOOLEAN NULL DEFAULT NULL,
  `UserPreferencesFavoritesWTShown` BOOLEAN NULL DEFAULT NULL,
  `ContactId` LONGTEXT NULL DEFAULT NULL,
  `AccountId` LONGTEXT NULL DEFAULT NULL,
  `CallCenterId` LONGTEXT NULL DEFAULT NULL,
  `Extension` LONGTEXT NULL DEFAULT NULL,
  `FederationIdentifier` LONGTEXT NULL DEFAULT NULL,
  `AboutMe` LONGTEXT NULL DEFAULT NULL,
  `FullPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `SmallPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `MediumPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `DigestFrequency` LONGTEXT NULL DEFAULT NULL,
  `DefaultGroupNotificationFrequency` LONGTEXT NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `BannerPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `SmallBannerPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `MediumBannerPhotoUrl` LONGTEXT NULL DEFAULT NULL,
  `IsProfilePhotoActive` BOOLEAN NULL DEFAULT NULL,
  `dsfs__DSProSFMembershipStatus__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSProSFPassword__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSProSFUsername__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserAppInfo
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserAppInfo` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `FormFactor` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserAppMenuCustomization
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserAppMenuCustomization` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ApplicationId` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserAppMenuCustomizationShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserAppMenuCustomizationShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserAppMenuItem
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserAppMenuItem` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `AppMenuItemId` LONGTEXT NULL DEFAULT NULL,
  `ApplicationId` LONGTEXT NULL DEFAULT NULL,
  `Label` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `UserSortOrder` INT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `LogoUrl` LONGTEXT NULL DEFAULT NULL,
  `IconUrl` LONGTEXT NULL DEFAULT NULL,
  `InfoUrl` LONGTEXT NULL DEFAULT NULL,
  `StartUrl` LONGTEXT NULL DEFAULT NULL,
  `MobileStartUrl` LONGTEXT NULL DEFAULT NULL,
  `IsVisible` BOOLEAN NULL DEFAULT NULL,
  `IsUsingAdminAuthorization` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserLicense
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserLicense` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `LicenseDefinitionKey` LONGTEXT NULL DEFAULT NULL,
  `TotalLicenses` INT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `UsedLicenses` INT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserListView
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserListView` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `ListViewId` LONGTEXT NULL DEFAULT NULL,
  `SobjectType` LONGTEXT NULL DEFAULT NULL,
  `LastViewedChart` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserListViewCriterion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserListViewCriterion` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `UserListViewId` LONGTEXT NULL DEFAULT NULL,
  `SortOrder` INT NULL DEFAULT NULL,
  `ColumnName` LONGTEXT NULL DEFAULT NULL,
  `Operation` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserLogin
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserLogin` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `IsFrozen` BOOLEAN NULL DEFAULT NULL,
  `IsPasswordLocked` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserPackageLicense
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserPackageLicense` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `PackageLicenseId` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserPreference
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserPreference` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `Preference` LONGTEXT NULL DEFAULT NULL,
  `Value` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserRole` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `ParentRoleId` LONGTEXT NULL DEFAULT NULL,
  `RollupDescription` LONGTEXT NULL DEFAULT NULL,
  `OpportunityAccessForAccountOwner` LONGTEXT NULL DEFAULT NULL,
  `CaseAccessForAccountOwner` LONGTEXT NULL DEFAULT NULL,
  `ContactAccessForAccountOwner` LONGTEXT NULL DEFAULT NULL,
  `ForecastUserId` LONGTEXT NULL DEFAULT NULL,
  `MayForecastManagerShare` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `DeveloperName` LONGTEXT NULL DEFAULT NULL,
  `PortalAccountId` LONGTEXT NULL DEFAULT NULL,
  `PortalType` LONGTEXT NULL DEFAULT NULL,
  `PortalAccountOwnerId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.UserShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`UserShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `UserAccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Vendor_Affiliates__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Vendor_Affiliates__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `Company__c` LONGTEXT NULL DEFAULT NULL,
  `Facilities__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `Vendor_Type__c` LONGTEXT NULL DEFAULT NULL,
  `Active__c` BOOLEAN NULL DEFAULT NULL,
  `Lead__c` LONGTEXT NULL DEFAULT NULL,
  `Operation_Start_Date__c` LONGTEXT NULL DEFAULT NULL,
  `Operator__c` LONGTEXT NULL DEFAULT NULL,
  `Account__c` LONGTEXT NULL DEFAULT NULL,
  `FID_vendor__c` LONGTEXT NULL DEFAULT NULL,
  `Site_Contaminated__c` BOOLEAN NULL DEFAULT NULL,
  `Golars_Project_No__c` LONGTEXT NULL DEFAULT NULL,
  `Golars_Tank_Paid_Services__c` BOOLEAN NULL DEFAULT NULL,
  `Client_Contact__c` LONGTEXT NULL DEFAULT NULL,
  `FID__c` LONGTEXT NULL DEFAULT NULL,
  `PERC_Concentration__c` DOUBLE NULL DEFAULT NULL,
  `Benzene_Concentration_ug_L__c` DOUBLE NULL DEFAULT NULL,
  `Tank_Installation_Year__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.VerificationHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`VerificationHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `EventGroup` INT NULL DEFAULT NULL,
  `VerificationTime` DATETIME NULL DEFAULT NULL,
  `VerificationMethod` LONGTEXT NULL DEFAULT NULL,
  `UserId` LONGTEXT NULL DEFAULT NULL,
  `Activity` LONGTEXT NULL DEFAULT NULL,
  `Status` LONGTEXT NULL DEFAULT NULL,
  `LoginHistoryId` LONGTEXT NULL DEFAULT NULL,
  `SourceIp` LONGTEXT NULL DEFAULT NULL,
  `LoginGeoId` LONGTEXT NULL DEFAULT NULL,
  `Remarks` LONGTEXT NULL DEFAULT NULL,
  `ResourceId` LONGTEXT NULL DEFAULT NULL,
  `Policy` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WebLink
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WebLink` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `PageOrSobjectType` LONGTEXT NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `IsProtected` BOOLEAN NULL DEFAULT NULL,
  `Url` LONGTEXT NULL DEFAULT NULL,
  `EncodingKey` LONGTEXT NULL DEFAULT NULL,
  `LinkType` LONGTEXT NULL DEFAULT NULL,
  `OpenType` LONGTEXT NULL DEFAULT NULL,
  `Height` INT NULL DEFAULT NULL,
  `Width` INT NULL DEFAULT NULL,
  `ShowsLocation` BOOLEAN NULL DEFAULT NULL,
  `HasScrollbars` BOOLEAN NULL DEFAULT NULL,
  `HasToolbar` BOOLEAN NULL DEFAULT NULL,
  `HasMenubar` BOOLEAN NULL DEFAULT NULL,
  `ShowsStatus` BOOLEAN NULL DEFAULT NULL,
  `IsResizable` BOOLEAN NULL DEFAULT NULL,
  `Position` LONGTEXT NULL DEFAULT NULL,
  `ScontrolId` LONGTEXT NULL DEFAULT NULL,
  `MasterLabel` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `DisplayType` LONGTEXT NULL DEFAULT NULL,
  `RequireRowSelection` BOOLEAN NULL DEFAULT NULL,
  `NamespacePrefix` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkAccess
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkAccess` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `AccessType` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkAccessShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkAccessShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkBadge
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkBadge` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `SourceId` LONGTEXT NULL DEFAULT NULL,
  `DefinitionId` LONGTEXT NULL DEFAULT NULL,
  `RecipientId` LONGTEXT NULL DEFAULT NULL,
  `GiverId` LONGTEXT NULL DEFAULT NULL,
  `ImageUrl` LONGTEXT NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `Message` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkBadgeDefinition
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkBadgeDefinition` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `IsCompanyWide` BOOLEAN NULL DEFAULT NULL,
  `Description` LONGTEXT NULL DEFAULT NULL,
  `ImageUrl` LONGTEXT NULL DEFAULT NULL,
  `IsActive` BOOLEAN NULL DEFAULT NULL,
  `LimitNumber` INT NULL DEFAULT NULL,
  `IsLimitPerUser` BOOLEAN NULL DEFAULT NULL,
  `LimitStartDate` DATE NULL DEFAULT NULL,
  `GivenBadgeCount` INT NULL DEFAULT NULL,
  `IsRewardBadge` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkBadgeDefinitionFeed
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkBadgeDefinitionFeed` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `Type` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `CommentCount` INT NULL DEFAULT NULL,
  `LikeCount` INT NULL DEFAULT NULL,
  `Title` LONGTEXT NULL DEFAULT NULL,
  `Body` LONGTEXT NULL DEFAULT NULL,
  `LinkUrl` LONGTEXT NULL DEFAULT NULL,
  `IsRichText` BOOLEAN NULL DEFAULT NULL,
  `RelatedRecordId` LONGTEXT NULL DEFAULT NULL,
  `InsertedById` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkBadgeDefinitionHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkBadgeDefinitionHistory` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `WorkBadgeDefinitionId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkBadgeDefinitionShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkBadgeDefinitionShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkThanks
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkThanks` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `GiverId` LONGTEXT NULL DEFAULT NULL,
  `Message` LONGTEXT NULL DEFAULT NULL,
  `FeedItemId` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.WorkThanksShare
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`WorkThanksShare` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `UserOrGroupId` LONGTEXT NULL DEFAULT NULL,
  `AccessLevel` LONGTEXT NULL DEFAULT NULL,
  `RowCause` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.Zip_To_County__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`Zip_To_County__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `ZIP_code__c` DOUBLE NULL DEFAULT NULL,
  `County__c` LONGTEXT NULL DEFAULT NULL,
  `External_ID__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSignAccountConfiguration__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSignAccountConfiguration__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `dsfs__AccountId__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterActionsUndoAndSend__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvCompletedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvCompleted__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeclinedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeclined__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeliveredText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvDelivered__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvSentText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvSent__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvVoidedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvVoided__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvelopeSigning__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipCompletedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipCompleted__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeclinedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeclined__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeliveredText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipDelivered__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipSentText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipSent__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipSignedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipSigned__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterSetting__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSProSFPassword__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSProSFUsername__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DefaultExpireNDays__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__DefaultReminderNDays__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__DefaultRepeatReminderNDays__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__DefaultRoleNames__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DefaultRoleValues__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DefaultWarnOfExpireNDays__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Default_Apex_Timeout__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__DisplayInPersonSigningInOwnWindow__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__DisplayTaggerInOwnWindow__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__DocuSignBaseURL__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSignEnvironment__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_de__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_es__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_fr__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_it__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_ja__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_ko__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_nl__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_pt_BR__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_ru__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailBody_zh_CN__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_de__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_es__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_fr__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_it__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_ja__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_ko__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_nl__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_pt_BR__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_ru__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EmailSubject_zh_CN__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__EnableNewMobileTaggingUI__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__FetchDocuments__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideChatter__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideEmailMessage__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideEmailSubject__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideRemindExpire__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideSendNowButton__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__HideTagButton__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__IncludeDefaultAnchorTabs__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__Lightning_Component_Logging__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__LoadFiles__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__LookupUser__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ManageUsersFields__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__OrganizationId__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__SetupDone__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__UpgradeHelper__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__UseAccountNotificationDefaults__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__UseSendOnBehalfOf__c` BOOLEAN NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Envelope_Document__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Envelope_Document__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `dsfs__DocuSign_EnvelopeID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Attachment_ID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Attachment_NameEx__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Attachment_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Document_ID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Document_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Document_Order__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__External_Document_Id__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__SFDocument_Type__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Validation_Message__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Envelope_Recipient__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Envelope_Recipient__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `dsfs__DocuSign_EnvelopeID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Access_Code__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_ContactID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_CustomFeaturesEx__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_CustomFeatures__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_CustomId__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_CustomName__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_LeadID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DSER_UserID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Recipient_Role__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Signature_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Signer_Type__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Email_Body__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Email_Subject__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ID_Check__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__LanguageCode__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Language__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Recipient_Email__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Recipient_Note_Long__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Recipient_Note__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__RoleName__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__RoleValue__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Routing_Order__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__SMSAuthentication_PhoneNumber__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Salesforce_Recipient_Type__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__SignInPersonEmail__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__SignInPersonName__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__SignNow__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__SigningGroupId__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Validation_Message__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Envelope__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Envelope__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `dsfs__ChatterEnvCompletedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvCompleted__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeclinedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeclined__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvDeliveredText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvDelivered__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvSentText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvSent__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterEnvVoidedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterEnvVoided__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipCompletedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipCompleted__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeclinedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeclined__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipDeliveredText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipDelivered__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipSentText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipSent__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterRecipSignedText__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__ChatterRecipSigned__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__ChatterUpdatesEnabled__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__Contact2eSignDoc01__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_1_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_1_Value__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_1__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_2_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_2_Value__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_2__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_3_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_3_Value__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Custom_Field_3__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Day_Prior_to_Warn_of_expiration__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Days_before_Envelope_is_Expired_Voided__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__DocuSign_Email_Message__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Email_Subject__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Envelope_ID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Envelope_Sent__c` DATETIME NULL DEFAULT NULL,
  `dsfs__DocumentID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Document_Name__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Expire_Void_Envelope__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__I_agree_to_Terms__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__I_will_Sign__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__Lead2eSignDoc01__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Reminder_Interval__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Reminder_Repeat_Interval_in_Days__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Send_Reminder__c` BOOLEAN NULL DEFAULT NULL,
  `dsfs__Sender__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Source_Object_Parent__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Source_Object__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Recipient_Status__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Recipient_Status__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Recipient_Status__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Recipient_Status__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `dsfs__Parent_Status_Record__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Account__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Contact__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Date_Declined__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Date_Delivered__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Date_Sent__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Date_Signed__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Decline_Reason_Extended__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Decline_Reason__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Recipient_Company__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Recipient_Email__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Recipient_Id__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Recipient_Title__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Routing_Order__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Envelope_Id__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Lead__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Recipient_Status__c` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Status__History
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Status__History` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `ParentId` LONGTEXT NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `Field` LONGTEXT NULL DEFAULT NULL,
  `OldValue` LONGTEXT NULL DEFAULT NULL,
  `NewValue` LONGTEXT NULL DEFAULT NULL);

-- ----------------------------------------------------------------------------
-- Table golarsdev.dsfs__DocuSign_Status__c
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `golarsdev`.`dsfs__DocuSign_Status__c` (
  `Id` LONGTEXT NULL DEFAULT NULL,
  `OwnerId` LONGTEXT NULL DEFAULT NULL,
  `IsDeleted` BOOLEAN NULL DEFAULT NULL,
  `Name` LONGTEXT NULL DEFAULT NULL,
  `CreatedDate` DATETIME NULL DEFAULT NULL,
  `CreatedById` LONGTEXT NULL DEFAULT NULL,
  `LastModifiedDate` DATETIME NULL DEFAULT NULL,
  `LastModifiedById` LONGTEXT NULL DEFAULT NULL,
  `SystemModstamp` DATETIME NULL DEFAULT NULL,
  `LastActivityDate` DATE NULL DEFAULT NULL,
  `LastViewedDate` DATETIME NULL DEFAULT NULL,
  `LastReferencedDate` DATETIME NULL DEFAULT NULL,
  `dsfs__Case__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Company__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Completed_Age__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Completed_Date_Time__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Contact__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Contract__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Days_to_Complete__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Declined_Date_Time__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Declined_Reason_Extended__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Declined_Reason__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__DocuSign_Envelope_ID__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Envelope_Link__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Envelope_Status__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Hours_to_Complete__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Hrs_Sent_to_Sign__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Lead__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Minutes_to_Complete__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Number_Completed__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Opportunity__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Sender_Email__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Sender__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Sent_Age__c` DOUBLE NULL DEFAULT NULL,
  `dsfs__Sent_Date_Time__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Subject__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Time_to_Complete__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Viewed_Date_Time__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Voided_Date_Time__c` DATETIME NULL DEFAULT NULL,
  `dsfs__Voided_Reason_Extended__c` LONGTEXT NULL DEFAULT NULL,
  `dsfs__Voided_Reason__c` LONGTEXT NULL DEFAULT NULL);
SET FOREIGN_KEY_CHECKS = 1;
