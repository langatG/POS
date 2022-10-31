USE [master]
GO
/****** Object:  Database [R1]    Script Date: 22/04/2021 5:47:12 PM ******/
USE [RetailPOS_DB]
GO
/****** Object:  Table [dbo].[Activation]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HardwareID] [nchar](100) NOT NULL,
	[ActivationID] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Activation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryName] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](250) NOT NULL,
	[MailingName] [nvarchar](250) NULL,
	[Country] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](200) NULL,
	[PinCode] [nchar](30) NULL,
	[ContactNo] [nchar](100) NULL,
	[Fax] [nchar](100) NULL,
	[Email] [nchar](200) NULL,
	[Website] [nvarchar](max) NULL,
	[TIN] [nchar](50) NULL,
	[LicenseNo] [nchar](50) NULL,
	[ServiceTaxNo] [nchar](100) NULL,
	[CST] [nchar](50) NULL,
	[PAN] [nchar](100) NULL,
	[CurrencyCode] [nchar](10) NULL,
	[Currency] [nchar](100) NULL,
	[Logo] [image] NULL,
	[ShowLogo] [nchar](20) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCustomer]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCustomer](
	[CC_ID] [int] NOT NULL,
	[CreditCustomerID] [nchar](30) NOT NULL,
	[Name] [nchar](200) NULL,
	[ContactNo] [nchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[OpeningBalanceType] [nchar](10) NULL,
	[RegistrationDate] [datetime] NULL,
	[Active] [nchar](10) NULL,
 CONSTRAINT [PK_CreditCustomer] PRIMARY KEY CLUSTERED 
(
	[CC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCustomerLedger]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCustomerLedger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[LedgerNo] [nchar](50) NULL,
	[Label] [nchar](200) NULL,
	[Debit] [decimal](18, 2) NULL,
	[Credit] [decimal](18, 2) NULL,
	[CreditCustomer_ID] [int] NULL,
 CONSTRAINT [PK_CreditCustomerLedger] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditCustomerPayment]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCustomerPayment](
	[T_ID] [int] NOT NULL,
	[TransactionID] [nchar](20) NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMode] [nchar](30) NULL,
	[CreditCustomer_ID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[PaymentModeDetails] [nvarchar](250) NULL,
 CONSTRAINT [PK_CreditCustomerPayment] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Currency]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyCode] [nchar](10) NOT NULL,
	[Currencyname] [nchar](200) NOT NULL,
	[Rate] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CurrencyRate] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NOT NULL,
	[CustomerID] [nchar](30) NULL,
	[Name] [nchar](200) NULL,
	[VATNo] [nchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[CustomerType] [nchar](30) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailSetting]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nchar](150) NOT NULL,
	[SMTPAddress] [nvarchar](250) NOT NULL,
	[Username] [nchar](200) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[Port] [int] NOT NULL,
	[TLS_SSL_Required] [nchar](10) NOT NULL,
	[IsDefault] [nchar](10) NOT NULL,
	[IsActive] [nchar](10) NOT NULL,
 CONSTRAINT [PK_EmailSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseName] [nvarchar](250) NOT NULL,
	[ExpenseType] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Expense_1] PRIMARY KEY CLUSTERED 
(
	[ExpenseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpenseType]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseType](
	[Type] [nchar](200) NOT NULL,
 CONSTRAINT [PK_ExpenseType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Product]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Product](
	[IPo_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Barcode] [nchar](100) NULL,
	[MfgDate] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[DiscountPer] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[VATPer] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[Qty] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[Margin] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Invoice_Product] PRIMARY KEY CLUSTERED 
(
	[IPo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceInfo]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceInfo](
	[Inv_ID] [int] NOT NULL,
	[InvoiceNo] [nchar](30) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[OpenID] [int] NULL,
	[PaymentMode] [nchar](200) NULL,
	[CurrencyCode] [nchar](50) NULL,
	[ExchangeRate] [decimal](18, 2) NULL,
	[DiscPer] [decimal](18, 2) NULL,
	[DiscAmt] [decimal](18, 2) NULL,
	[GrandTotal] [decimal](18, 2) NULL,
	[Cash] [decimal](18, 2) NULL,
	[Change] [decimal](18, 2) NULL,
	[TaxType] [nchar](20) NULL,
	[Member_ID] [nchar](50) NULL,
	[SalesmanID] [int] NULL,
	[LoyaltyPoints] [int] NULL,
	[LoyaltyAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_InvoiceInfo] PRIMARY KEY CLUSTERED 
(
	[Inv_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Journal]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Journal](
	[ID] [int] NOT NULL,
	[DebitAccount] [nchar](200) NULL,
	[CreditAccount] [nchar](200) NULL,
	[Date] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Journal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LedgerBook]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LedgerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[AccLedger] [nchar](200) NULL,
	[LedgerNo] [nchar](200) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[Debit] [decimal](18, 2) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[PartyID] [nchar](50) NULL,
 CONSTRAINT [PK_LedgerBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](100) NOT NULL,
	[Operation] [nvarchar](250) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoyaltyMember]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoyaltyMember](
	[MemberID] [int] NOT NULL,
	[Name] [nchar](200) NULL,
	[ContactNo] [nchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[RegistrationDate] [datetime] NULL,
	[Active] [nchar](10) NULL,
	[CardNo] [nchar](50) NULL,
 CONSTRAINT [PK_LoyaltyMember] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoyaltyMemberLedgerBook]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoyaltyMemberLedgerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[LedgerNo] [nchar](50) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[PointsEarned] [int] NOT NULL,
	[PointsRedeem] [int] NOT NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_LoyaltyMemberBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoyaltySetting]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoyaltySetting](
	[LoyaltyName] [nchar](150) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_LoyaltySetting] PRIMARY KEY CLUSTERED 
(
	[LoyaltyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Party]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Party](
	[PT_ID] [int] NOT NULL,
	[Partyname] [nvarchar](250) NOT NULL,
	[Alias] [nchar](200) NULL,
	[Country] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[City] [nchar](200) NOT NULL,
	[State] [nchar](200) NULL,
	[PinCode] [nchar](30) NULL,
	[ContactNo] [nchar](100) NOT NULL,
	[Fax] [nchar](100) NULL,
	[Email] [nchar](200) NULL,
	[TIN] [nchar](50) NULL,
	[CST] [nchar](50) NULL,
	[PAN] [nchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NOT NULL,
	[BalanceType] [nchar](20) NOT NULL,
	[CreditLimit] [decimal](18, 2) NOT NULL,
	[CreditDays] [int] NOT NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[PT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[T_ID] [int] NOT NULL,
	[TransactionID] [nchar](20) NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMode] [nchar](30) NULL,
	[SupplierID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[PaymentModeDetails] [nvarchar](250) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_ClosingCash]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ClosingCash](
	[ClosingID] [int] NOT NULL,
	[OpenID] [int] NOT NULL,
	[ClosingDate] [datetime] NULL,
	[ClosingBalance] [decimal](18, 2) NULL,
 CONSTRAINT [PK_POS_ClosingCash] PRIMARY KEY CLUSTERED 
(
	[ClosingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_HoldBill]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_HoldBill](
	[Hold_ID] [nchar](20) NOT NULL,
	[OpenID] [int] NULL,
	[Date] [datetime] NULL,
	[DiscPer] [decimal](18, 2) NULL,
	[DiscAmt] [decimal](18, 2) NULL,
 CONSTRAINT [PK_POS_HoldBill] PRIMARY KEY CLUSTERED 
(
	[Hold_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_HoldBillItems]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_HoldBillItems](
	[HBI_ID] [int] IDENTITY(1,1) NOT NULL,
	[HoldID] [nchar](20) NULL,
	[ProductID] [int] NULL,
	[Barcode] [nchar](100) NULL,
	[MfgDate] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[DiscountPer] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[VATPer] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[Qty] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[Margin] [decimal](18, 2) NULL,
 CONSTRAINT [PK_POS_HoldBillItems] PRIMARY KEY CLUSTERED 
(
	[HBI_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POS_OpeningCash]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_OpeningCash](
	[OpenID] [int] NOT NULL,
	[TillDetails] [nchar](100) NULL,
	[UserID] [nchar](100) NOT NULL,
	[OpeningDate] [datetime] NULL,
	[OpeningCash] [decimal](18, 2) NULL,
	[Closed] [int] NULL,
 CONSTRAINT [PK_POS_OpeningCash] PRIMARY KEY CLUSTERED 
(
	[OpenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PosPrinterSetting]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PosPrinterSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrinterName] [nvarchar](250) NOT NULL,
	[IsEnabled] [nchar](20) NOT NULL,
	[TillID] [nchar](100) NULL,
	[CashDrawer] [nchar](20) NULL,
	[CustomerDisplay] [nchar](20) NULL,
	[CDPort] [nchar](30) NULL,
 CONSTRAINT [PK_PosPrinterSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] NOT NULL,
	[ProductCode] [nchar](50) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Alias] [nchar](150) NULL,
	[VATCommodity] [nchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Barcode] [nchar](100) NULL,
	[Category] [nchar](200) NULL,
	[PurchaseUnit] [nchar](30) NULL,
	[SalesUnit] [nchar](30) NULL,
	[PurchaseCost] [decimal](18, 2) NULL,
	[SalesCost] [decimal](18, 2) NULL,
	[ReorderPoint] [int] NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_OpeningStock]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_OpeningStock](
	[PS_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[StorageType] [nchar](20) NULL,
	[Warehouse_Store] [nchar](250) NULL,
	[Qty] [decimal](18, 2) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[ManufacturingDate] [nchar](50) NULL,
 CONSTRAINT [PK_Product_OpeningStock] PRIMARY KEY CLUSTERED 
(
	[PS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductLocation]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RackNo] [nchar](50) NULL,
	[ProductID] [int] NULL,
	[ShelfPosition] [nchar](20) NULL,
 CONSTRAINT [PK_ProductLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[ST_ID] [int] NOT NULL,
	[InvoiceNo] [nchar](30) NOT NULL,
	[Date] [datetime] NOT NULL,
	[PurchaseType] [nchar](20) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[FreightCharges] [decimal](18, 2) NOT NULL,
	[OtherCharges] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[RoundOff] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPayment] [decimal](18, 2) NOT NULL,
	[PaymentDue] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[VATPer] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[ReferenceNo1] [nchar](50) NULL,
	[ReferenceNo2] [nchar](50) NULL,
	[SupplierInvoiceNo] [nchar](50) NULL,
	[SupplierInvoiceDate] [datetime] NULL,
	[TaxType] [nchar](20) NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchase_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase_Join](
	[SP_ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[StorageType] [nchar](20) NULL,
	[Warehouse_Store] [nchar](250) NOT NULL,
	[SalesCost] [decimal](18, 2) NULL,
	[Barcode] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[ManufacturingDate] [nchar](30) NULL,
 CONSTRAINT [PK_Purchase_Join] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PO_ID] [int] NOT NULL,
	[PONumber] [nchar](50) NOT NULL,
	[Date] [datetime] NULL,
	[Supplier_ID] [int] NULL,
	[Terms] [nvarchar](max) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[VATPer] [decimal](18, 2) NULL,
	[VATAmount] [decimal](18, 2) NULL,
	[GrandTotal] [decimal](18, 2) NULL,
	[TaxType] [nchar](20) NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PO_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder_Join](
	[POJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[PricePerUnit] [decimal](18, 2) NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PurchaseOrder_Join] PRIMARY KEY CLUSTERED 
(
	[POJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[PR_ID] [int] NOT NULL,
	[PRNo] [nchar](30) NULL,
	[Date] [datetime] NULL,
	[PurchaseID] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[DiscPer] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[VATPer] [decimal](18, 2) NULL,
	[VATAmt] [decimal](18, 2) NULL,
	[FreightCharges] [decimal](18, 2) NULL,
	[OtherCharges] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[RoundOff] [decimal](18, 2) NULL,
	[GrandTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_PurchaseReturn] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReturn_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn_Join](
	[PRJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseReturnID] [int] NOT NULL,
	[ProductID] [nchar](10) NULL,
	[Qty] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Warehouse_Store] [nchar](250) NULL,
	[SalesCost] [decimal](18, 2) NULL,
	[Barcode] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[ManufacturingDate] [nchar](30) NULL,
	[ReturnQty] [decimal](18, 2) NULL,
	[StorageType] [nchar](20) NULL,
 CONSTRAINT [PK_PurchaseReturn_Join] PRIMARY KEY CLUSTERED 
(
	[PRJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Q_ID] [int] NOT NULL,
	[QuotationNo] [nchar](30) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation_Join](
	[QJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[VATPer] [decimal](18, 2) NOT NULL,
	[VAT] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Quotation_Join] PRIMARY KEY CLUSTERED 
(
	[QJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Racking]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racking](
	[RackNo] [nchar](50) NOT NULL,
	[NoOfShelves] [int] NULL,
	[Active] [nchar](10) NULL,
 CONSTRAINT [PK_Racking] PRIMARY KEY CLUSTERED 
(
	[RackNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[UserID] [nchar](100) NOT NULL,
	[UserType] [nchar](30) NOT NULL,
	[Password] [nchar](50) NOT NULL,
	[Name] [nchar](150) NOT NULL,
	[ContactNo] [nchar](50) NULL,
	[EmailID] [nchar](150) NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Active] [nchar](10) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SalesID] [int] NOT NULL,
	[BillNo] [nchar](30) NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[BillShamsiDate] [datetime] NOT NULL,
	[RefNo1] [nchar](50) NULL,
	[RefNo2] [nchar](50) NULL,
	[SalesType] [nchar](20) NOT NULL,
	[UserOperator] [nchar](100) NOT NULL,
	[PartyID] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[FreightCharges] [decimal](18, 2) NOT NULL,
	[OtherCharges] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[RoundOff] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPaid] [decimal](18, 2) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Product]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Product](
	[SP_ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Warehouse] [nchar](250) NOT NULL,
	[QtyPerCarton] [int] NOT NULL,
	[TotalQty] [int] NOT NULL,
	[PricePerQtyBC] [decimal](18, 2) NOT NULL,
	[CurrencyCode] [nchar](10) NOT NULL,
	[Total_SalesdCurrency] [decimal](18, 2) NOT NULL,
	[ExchangeRate] [decimal](18, 2) NOT NULL,
	[PricePerQty] [decimal](18, 2) NOT NULL,
	[Total_QuotedCurrency] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[VATPer] [decimal](18, 2) NOT NULL,
	[VAT] [decimal](18, 2) NOT NULL,
	[AdditionalVAT] [decimal](18, 2) NOT NULL,
	[AdditionalVATPer] [decimal](18, 2) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Sales_Product] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesMan]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesMan](
	[SM_ID] [int] NOT NULL,
	[SalesMan_ID] [nchar](30) NULL,
	[Name] [nchar](200) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[CommissionPer] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SalesMan] PRIMARY KEY CLUSTERED 
(
	[SM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salesman_Commission]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesman_Commission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[CommissionPer] [decimal](18, 2) NOT NULL,
	[Commission] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Salesman_Commission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SR_ID] [int] NOT NULL,
	[SRNo] [nchar](50) NULL,
	[Date] [date] NULL,
	[SalesID] [int] NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[VAT] [decimal](18, 2) NULL,
	[GrandTotal] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SalesReturn] PRIMARY KEY CLUSTERED 
(
	[SR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturn_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn_Join](
	[SRJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesReturnID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Barcode] [nchar](50) NULL,
	[ManufacturingDate] [nchar](30) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
	[SalesCost] [decimal](18, 2) NULL,
	[DiscPer] [decimal](18, 2) NULL,
	[DiscAmt] [decimal](18, 2) NULL,
	[CGSTPer] [decimal](18, 2) NULL,
	[CGSTAmt] [decimal](18, 2) NULL,
	[ReturnQty] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SalesReturn_Join] PRIMARY KEY CLUSTERED 
(
	[SRJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseTax] [nchar](20) NOT NULL,
	[SalesTax] [nchar](20) NOT NULL,
 CONSTRAINT [PK_PurchaseSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSSetting]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[APIURL] [nvarchar](max) NOT NULL,
	[IsDefault] [nchar](10) NOT NULL,
	[IsEnabled] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SMSSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockAdjustment_Store]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAdjustment_Store](
	[SA_ID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[Barcode] [nchar](30) NULL,
	[Date] [datetime] NULL,
	[AdjustmentType] [nchar](20) NULL,
	[Qty] [decimal](18, 2) NULL,
	[Reason] [nchar](200) NULL,
 CONSTRAINT [PK_StockAdjustment_Store] PRIMARY KEY CLUSTERED 
(
	[SA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockAdjustment_Warehouse]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockAdjustment_Warehouse](
	[SA_ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Warehouse] [nchar](250) NULL,
	[ProductID] [int] NULL,
	[Barcode] [nchar](30) NULL,
	[AdjustmentType] [nchar](20) NULL,
	[Qty] [decimal](18, 2) NULL,
	[Reason] [nchar](200) NULL,
 CONSTRAINT [PK_StockAdjustment_Warehouse] PRIMARY KEY CLUSTERED 
(
	[SA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockTransfer]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransfer](
	[ST_ID] [int] NOT NULL,
	[TransferID] [nchar](30) NULL,
	[Date] [datetime] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_StockTransfer_1] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockTransfer_Join]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransfer_Join](
	[STJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[StockTransferID] [int] NOT NULL,
	[Warehouse] [nchar](250) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Barcode] [nchar](50) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[ManufacturingDate] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
 CONSTRAINT [PK_StockTransfer] PRIMARY KEY CLUSTERED 
(
	[STJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockTransfer_Join_W2W]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransfer_Join_W2W](
	[STJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[StockTransferID] [int] NOT NULL,
	[Warehouse] [nchar](250) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Barcode] [nchar](50) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[ManufacturingDate] [nchar](50) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[Qty] [decimal](18, 2) NULL,
 CONSTRAINT [PK_StockTransfer_W2W] PRIMARY KEY CLUSTERED 
(
	[STJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockTransfer_W2W]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransfer_W2W](
	[ST_ID] [int] NOT NULL,
	[TransferID] [nchar](30) NULL,
	[Date] [datetime] NOT NULL,
	[Warehouse] [nchar](250) NOT NULL,
 CONSTRAINT [PK_StockTransfer_W2W_1] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] NOT NULL,
	[SupplierID] [nchar](30) NOT NULL,
	[Name] [nchar](200) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[TIN] [nchar](100) NULL,
	[STNo] [nchar](100) NULL,
	[CST] [nchar](100) NULL,
	[PAN] [nchar](100) NULL,
	[AccountName] [nchar](150) NULL,
	[AccountNumber] [nchar](100) NULL,
	[Bank] [nchar](150) NULL,
	[Branch] [nchar](150) NULL,
	[IFSCCode] [nchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[OpeningBalanceType] [nchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierLedgerBook]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierLedgerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[LedgerNo] [nchar](50) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[Debit] [decimal](18, 2) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[PartyID] [nchar](20) NULL,
 CONSTRAINT [PK_SupplierLedgerBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxMaster]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxMaster](
	[TaxName] [nchar](200) NOT NULL,
	[TaxType] [nchar](200) NOT NULL,
	[Percentage] [decimal](18, 2) NOT NULL,
	[AdditionalPercentage] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TaxMaster] PRIMARY KEY CLUSTERED 
(
	[TaxName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaxType]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxType](
	[Type] [nchar](200) NOT NULL,
 CONSTRAINT [PK_TaxType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temp_Stock]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Warehouse] [nchar](250) NOT NULL,
	[Barcode] [nchar](30) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[Qty] [decimal](18, 2) NULL,
	[ExpiryDate] [nchar](50) NULL,
	[ManufacturingDate] [nchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temp_Stock_Company]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Barcode] [nchar](30) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[SalesRate] [decimal](18, 2) NULL,
	[ManufacturingDate] [nchar](30) NULL,
	[ExpiryDate] [nchar](30) NULL,
	[Qty] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Temp_Stock_Store] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitMaster]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMaster](
	[Unit] [nchar](150) NOT NULL,
 CONSTRAINT [PK_UnitMaster] PRIMARY KEY CLUSTERED 
(
	[Unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[ID] [int] NOT NULL,
	[VoucherNo] [nchar](30) NOT NULL,
	[Name] [nchar](150) NULL,
	[Date] [datetime] NOT NULL,
	[Details] [nvarchar](max) NULL,
	[PaymentMode] [nchar](150) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher_OtherDetails]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher_OtherDetails](
	[VD_ID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherID] [int] NOT NULL,
	[Particulars] [nvarchar](250) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Voucher_OtherDetails] PRIMARY KEY CLUSTERED 
(
	[VD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[WalletType] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[WalletType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseName] [nchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[WarehouseType] [nchar](200) NOT NULL,
	[City] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WarehouseType]    Script Date: 22/04/2021 5:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseType](
	[Type] [nchar](200) NOT NULL,
 CONSTRAINT [PK_WarehouseType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Registration] ([UserID], [UserType], [Password], [Name], [ContactNo], [EmailID], [JoiningDate], [Active]) VALUES (N'admin                                                                                               ', N'Admin                         ', N'MTIzNA==                                          ', N'Vaibhav Patidar                                                                                                                                       ', N'+919630014949                                     ', N'vaibhavpatidar36@gmail.com                                                                                                                            ', CAST(N'2018-01-07 06:29:32.050' AS DateTime), N'Yes       ')
INSERT [dbo].[Registration] ([UserID], [UserType], [Password], [Name], [ContactNo], [EmailID], [JoiningDate], [Active]) VALUES (N'Cashier                                                                                             ', N'Cashier                       ', N'NjEyNA==                                          ', N'Cashier                                                                                                                                               ', N'+919630014949                                     ', N'cashier@gmail.com                                                                                                                                     ', CAST(N'2018-01-13 12:39:09.587' AS DateTime), N'Yes       ')
ALTER TABLE [dbo].[CreditCustomer] ADD  CONSTRAINT [DF_CreditCustomer_OpeningBalance]  DEFAULT ((0.00)) FOR [OpeningBalance]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_DiscountPer]  DEFAULT ((0.00)) FOR [DiscountPer]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_Discount]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_VAT]  DEFAULT ((0.00)) FOR [VAT]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[Invoice_Product] ADD  CONSTRAINT [DF_Invoice_Product_TotalAmount]  DEFAULT ((0.00)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[InvoiceInfo] ADD  CONSTRAINT [DF_InvoiceInfo_ExchangeRate]  DEFAULT ((1.00)) FOR [ExchangeRate]
GO
ALTER TABLE [dbo].[InvoiceInfo] ADD  CONSTRAINT [DF_InvoiceInfo_DiscPer]  DEFAULT ((0.00)) FOR [DiscPer]
GO
ALTER TABLE [dbo].[InvoiceInfo] ADD  CONSTRAINT [DF_InvoiceInfo_DiscAmt]  DEFAULT ((0.00)) FOR [DiscAmt]
GO
ALTER TABLE [dbo].[InvoiceInfo] ADD  CONSTRAINT [DF_InvoiceInfo_SalesmanID]  DEFAULT ((0)) FOR [SalesmanID]
GO
ALTER TABLE [dbo].[Party] ADD  CONSTRAINT [DF_Party_OpeningBalance]  DEFAULT ((0.00)) FOR [OpeningBalance]
GO
ALTER TABLE [dbo].[Party] ADD  CONSTRAINT [DF_Party_CreditLimit]  DEFAULT ((0.00)) FOR [CreditLimit]
GO
ALTER TABLE [dbo].[Party] ADD  CONSTRAINT [DF_Party_CreditDays]  DEFAULT ((0)) FOR [CreditDays]
GO
ALTER TABLE [dbo].[POS_ClosingCash] ADD  CONSTRAINT [DF_POS_ClosingCash_ClosingBalance]  DEFAULT ((0.00)) FOR [ClosingBalance]
GO
ALTER TABLE [dbo].[POS_HoldBill] ADD  CONSTRAINT [DF_POS_HoldBill_DiscPer]  DEFAULT ((0.00)) FOR [DiscPer]
GO
ALTER TABLE [dbo].[POS_HoldBill] ADD  CONSTRAINT [DF_POS_HoldBill_DiscAmt]  DEFAULT ((0.00)) FOR [DiscAmt]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_DiscountPer]  DEFAULT ((0.00)) FOR [DiscountPer]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_Discount]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_VAT]  DEFAULT ((0.00)) FOR [VAT]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_Qty]  DEFAULT ((1)) FOR [Qty]
GO
ALTER TABLE [dbo].[POS_HoldBillItems] ADD  CONSTRAINT [DF_POS_HoldBillItems_TotalAmount]  DEFAULT ((0.00)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[POS_OpeningCash] ADD  CONSTRAINT [DF_POS_OpeningCash_OpeningCash]  DEFAULT ((0.00)) FOR [OpeningCash]
GO
ALTER TABLE [dbo].[POS_OpeningCash] ADD  CONSTRAINT [DF_POS_OpeningCash_Closed]  DEFAULT ((0)) FOR [Closed]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_PurchaseCost]  DEFAULT ((0.00)) FOR [PurchaseCost]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_SalesCost]  DEFAULT ((0.00)) FOR [SalesCost]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ReorderPoint]  DEFAULT ((0)) FOR [ReorderPoint]
GO
ALTER TABLE [dbo].[Product_OpeningStock] ADD  CONSTRAINT [DF_Product_OpeningStock_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_DiscountPer]  DEFAULT ((0.00)) FOR [DiscountPer]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Discount]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_PreviousDue]  DEFAULT ((0.00)) FOR [PreviousDue]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_FreightCharges]  DEFAULT ((0.00)) FOR [FreightCharges]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_OtherCharges]  DEFAULT ((0.00)) FOR [OtherCharges]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_Total]  DEFAULT ((0.00)) FOR [Total]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_RoundOff]  DEFAULT ((0.00)) FOR [RoundOff]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_TotalPayment]  DEFAULT ((0.00)) FOR [TotalPayment]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_PaymentDue]  DEFAULT ((0.00)) FOR [PaymentDue]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[Purchase] ADD  CONSTRAINT [DF_Purchase_VAT]  DEFAULT ((0.00)) FOR [VAT]
GO
ALTER TABLE [dbo].[Purchase_Join] ADD  CONSTRAINT [DF_Purchase_Join_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Purchase_Join] ADD  CONSTRAINT [DF_Purchase_Join_Price]  DEFAULT ((0.00)) FOR [Price]
GO
ALTER TABLE [dbo].[Purchase_Join] ADD  CONSTRAINT [DF_Purchase_Join_SalesCost]  DEFAULT ((0.00)) FOR [SalesCost]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_VATAmount]  DEFAULT ((0.00)) FOR [VATAmount]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  CONSTRAINT [DF_PurchaseOrder_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[PurchaseOrder_Join] ADD  CONSTRAINT [DF_PurchaseOrder_Join_PricePerUnit]  DEFAULT ((0.00)) FOR [PricePerUnit]
GO
ALTER TABLE [dbo].[PurchaseOrder_Join] ADD  CONSTRAINT [DF_PurchaseOrder_Join_Amount]  DEFAULT ((0.00)) FOR [Amount]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_DiscPer]  DEFAULT ((0.00)) FOR [DiscPer]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_Discount]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_VATAmt]  DEFAULT ((0.00)) FOR [VATAmt]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_Total]  DEFAULT ((0.00)) FOR [Total]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_RoundOff]  DEFAULT ((0.00)) FOR [RoundOff]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[SalesMan] ADD  CONSTRAINT [DF_SalesMan_Commission]  DEFAULT ((0.00)) FOR [CommissionPer]
GO
ALTER TABLE [dbo].[Salesman_Commission] ADD  CONSTRAINT [DF_Salesman_Commission_CommissionPer]  DEFAULT ((0.00)) FOR [CommissionPer]
GO
ALTER TABLE [dbo].[Salesman_Commission] ADD  CONSTRAINT [DF_Salesman_Commission_Commission]  DEFAULT ((0.00)) FOR [Commission]
GO
ALTER TABLE [dbo].[StockTransfer_Join] ADD  CONSTRAINT [DF_StockTransfer_Join_SalesRate]  DEFAULT ((0.00)) FOR [SalesRate]
GO
ALTER TABLE [dbo].[StockTransfer_Join_W2W] ADD  CONSTRAINT [DF_StockTransfer_Join_W2W_SalesRate]  DEFAULT ((0.00)) FOR [SalesRate]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_OpeningBalance]  DEFAULT ((0.00)) FOR [OpeningBalance]
GO
ALTER TABLE [dbo].[Temp_Stock] ADD  CONSTRAINT [DF_Temp_Stock_SalesRate]  DEFAULT ((0.00)) FOR [SalesRate]
GO
ALTER TABLE [dbo].[Temp_Stock] ADD  CONSTRAINT [DF_Temp_Stock_Qty]  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[Temp_Stock_Company] ADD  CONSTRAINT [DF_Temp_Stock_Company_SalesRate]  DEFAULT ((0.00)) FOR [SalesRate]
GO
ALTER TABLE [dbo].[Temp_Stock_Company] ADD  CONSTRAINT [DF_Temp_Stock_Company_Qty]  DEFAULT ((0.00)) FOR [Qty]
GO
ALTER TABLE [dbo].[CreditCustomerLedger]  WITH CHECK ADD  CONSTRAINT [FK_CreditCustomerLedger_CreditCustomer] FOREIGN KEY([CreditCustomer_ID])
REFERENCES [dbo].[CreditCustomer] ([CC_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CreditCustomerLedger] CHECK CONSTRAINT [FK_CreditCustomerLedger_CreditCustomer]
GO
ALTER TABLE [dbo].[CreditCustomerPayment]  WITH CHECK ADD  CONSTRAINT [FK_CreditCustomerPayment_CreditCustomer] FOREIGN KEY([CreditCustomer_ID])
REFERENCES [dbo].[CreditCustomer] ([CC_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CreditCustomerPayment] CHECK CONSTRAINT [FK_CreditCustomerPayment_CreditCustomer]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_ExpenseType] FOREIGN KEY([ExpenseType])
REFERENCES [dbo].[ExpenseType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_ExpenseType]
GO
ALTER TABLE [dbo].[Invoice_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product_InvoiceInfo] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Product] CHECK CONSTRAINT [FK_Invoice_Product_InvoiceInfo]
GO
ALTER TABLE [dbo].[Invoice_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Product] CHECK CONSTRAINT [FK_Invoice_Product_Product]
GO
ALTER TABLE [dbo].[InvoiceInfo]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo_POS_OpeningCash] FOREIGN KEY([OpenID])
REFERENCES [dbo].[POS_OpeningCash] ([OpenID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoiceInfo] CHECK CONSTRAINT [FK_InvoiceInfo_POS_OpeningCash]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Registration] FOREIGN KEY([UserID])
REFERENCES [dbo].[Registration] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Registration]
GO
ALTER TABLE [dbo].[LoyaltyMemberLedgerBook]  WITH CHECK ADD  CONSTRAINT [FK_LoyaltyMemberLedgerBook_LoyaltyMember] FOREIGN KEY([MemberID])
REFERENCES [dbo].[LoyaltyMember] ([MemberID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LoyaltyMemberLedgerBook] CHECK CONSTRAINT [FK_LoyaltyMemberLedgerBook_LoyaltyMember]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Supplier]
GO
ALTER TABLE [dbo].[POS_ClosingCash]  WITH CHECK ADD  CONSTRAINT [FK_POS_ClosingCash_POS_OpeningCash] FOREIGN KEY([OpenID])
REFERENCES [dbo].[POS_OpeningCash] ([OpenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_ClosingCash] CHECK CONSTRAINT [FK_POS_ClosingCash_POS_OpeningCash]
GO
ALTER TABLE [dbo].[POS_HoldBill]  WITH CHECK ADD  CONSTRAINT [FK_POS_HoldBill_POS_OpeningCash] FOREIGN KEY([OpenID])
REFERENCES [dbo].[POS_OpeningCash] ([OpenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_HoldBill] CHECK CONSTRAINT [FK_POS_HoldBill_POS_OpeningCash]
GO
ALTER TABLE [dbo].[POS_HoldBillItems]  WITH CHECK ADD  CONSTRAINT [FK_POS_HoldBillItems_POS_HoldBill] FOREIGN KEY([HoldID])
REFERENCES [dbo].[POS_HoldBill] ([Hold_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_HoldBillItems] CHECK CONSTRAINT [FK_POS_HoldBillItems_POS_HoldBill]
GO
ALTER TABLE [dbo].[POS_HoldBillItems]  WITH CHECK ADD  CONSTRAINT [FK_POS_HoldBillItems_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POS_HoldBillItems] CHECK CONSTRAINT [FK_POS_HoldBillItems_Product1]
GO
ALTER TABLE [dbo].[POS_OpeningCash]  WITH CHECK ADD  CONSTRAINT [FK_POS_OpeningCash_Registration] FOREIGN KEY([UserID])
REFERENCES [dbo].[Registration] ([UserID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[POS_OpeningCash] CHECK CONSTRAINT [FK_POS_OpeningCash_Registration]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([CategoryName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TaxMaster] FOREIGN KEY([VATCommodity])
REFERENCES [dbo].[TaxMaster] ([TaxName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TaxMaster]
GO
ALTER TABLE [dbo].[Product_OpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_Product_OpeningStock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_OpeningStock] CHECK CONSTRAINT [FK_Product_OpeningStock_Product]
GO
ALTER TABLE [dbo].[ProductLocation]  WITH CHECK ADD  CONSTRAINT [FK_ProductLocation_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductLocation] CHECK CONSTRAINT [FK_ProductLocation_Product]
GO
ALTER TABLE [dbo].[ProductLocation]  WITH CHECK ADD  CONSTRAINT [FK_ProductLocation_Racking] FOREIGN KEY([RackNo])
REFERENCES [dbo].[Racking] ([RackNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductLocation] CHECK CONSTRAINT [FK_ProductLocation_Racking]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Supplier]
GO
ALTER TABLE [dbo].[Purchase_Join]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Purchase_Join] CHECK CONSTRAINT [FK_Purchase_Join_Product]
GO
ALTER TABLE [dbo].[Purchase_Join]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Join_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([ST_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Purchase_Join] CHECK CONSTRAINT [FK_Purchase_Join_Purchase]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchaseOrder_Join]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder_Join] CHECK CONSTRAINT [FK_PurchaseOrder_Join_Product]
GO
ALTER TABLE [dbo].[PurchaseOrder_Join]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Join_PurchaseOrder] FOREIGN KEY([PurchaseOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PO_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder_Join] CHECK CONSTRAINT [FK_PurchaseOrder_Join_PurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturn_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([ST_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PurchaseReturn] CHECK CONSTRAINT [FK_PurchaseReturn_Purchase]
GO
ALTER TABLE [dbo].[PurchaseReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturn_Join_Product] FOREIGN KEY([PurchaseReturnID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseReturn_Join] CHECK CONSTRAINT [FK_PurchaseReturn_Join_Product]
GO
ALTER TABLE [dbo].[PurchaseReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturn_Join_PurchaseReturn] FOREIGN KEY([PurchaseReturnID])
REFERENCES [dbo].[PurchaseReturn] ([PR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseReturn_Join] CHECK CONSTRAINT [FK_PurchaseReturn_Join_PurchaseReturn]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation_Join] CHECK CONSTRAINT [FK_Quotation_Join_Product]
GO
ALTER TABLE [dbo].[Quotation_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Join_Quotation] FOREIGN KEY([QuotationID])
REFERENCES [dbo].[Quotation] ([Q_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quotation_Join] CHECK CONSTRAINT [FK_Quotation_Join_Quotation]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Party] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Party] ([PT_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Party]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Registration] FOREIGN KEY([UserOperator])
REFERENCES [dbo].[Registration] ([UserID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Registration]
GO
ALTER TABLE [dbo].[Sales_Product]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sales_Product] CHECK CONSTRAINT [FK_Sales_Product_Product]
GO
ALTER TABLE [dbo].[Sales_Product]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Product_Sales] FOREIGN KEY([SalesID])
REFERENCES [dbo].[Sales] ([SalesID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sales_Product] CHECK CONSTRAINT [FK_Sales_Product_Sales]
GO
ALTER TABLE [dbo].[Sales_Product]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Product_Warehouse] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouse] ([WarehouseName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sales_Product] CHECK CONSTRAINT [FK_Sales_Product_Warehouse]
GO
ALTER TABLE [dbo].[Salesman_Commission]  WITH CHECK ADD  CONSTRAINT [FK_Salesman_Commission_InvoiceInfo] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Salesman_Commission] CHECK CONSTRAINT [FK_Salesman_Commission_InvoiceInfo]
GO
ALTER TABLE [dbo].[SalesReturn]  WITH CHECK ADD  CONSTRAINT [FK_SalesReturn_InvoiceInfo] FOREIGN KEY([SalesID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SalesReturn] CHECK CONSTRAINT [FK_SalesReturn_InvoiceInfo]
GO
ALTER TABLE [dbo].[SalesReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_SalesReturn_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesReturn_Join] CHECK CONSTRAINT [FK_SalesReturn_Join_Product]
GO
ALTER TABLE [dbo].[SalesReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_SalesReturn_Join_SalesReturn] FOREIGN KEY([SalesReturnID])
REFERENCES [dbo].[SalesReturn] ([SR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesReturn_Join] CHECK CONSTRAINT [FK_SalesReturn_Join_SalesReturn]
GO
ALTER TABLE [dbo].[StockAdjustment_Store]  WITH CHECK ADD  CONSTRAINT [FK_StockAdjustment_Store_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockAdjustment_Store] CHECK CONSTRAINT [FK_StockAdjustment_Store_Product]
GO
ALTER TABLE [dbo].[StockAdjustment_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_StockAdjustment_Warehouse_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockAdjustment_Warehouse] CHECK CONSTRAINT [FK_StockAdjustment_Warehouse_Product]
GO
ALTER TABLE [dbo].[StockAdjustment_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_StockAdjustment_Warehouse_Warehouse] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouse] ([WarehouseName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockAdjustment_Warehouse] CHECK CONSTRAINT [FK_StockAdjustment_Warehouse_Warehouse]
GO
ALTER TABLE [dbo].[StockTransfer]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer] CHECK CONSTRAINT [FK_StockTransfer_Company]
GO
ALTER TABLE [dbo].[StockTransfer_Join]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Join_StockTransfer] FOREIGN KEY([StockTransferID])
REFERENCES [dbo].[StockTransfer] ([ST_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_Join] CHECK CONSTRAINT [FK_StockTransfer_Join_StockTransfer]
GO
ALTER TABLE [dbo].[StockTransfer_Join]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_Join] CHECK CONSTRAINT [FK_StockTransfer_Product]
GO
ALTER TABLE [dbo].[StockTransfer_Join]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Warehouse] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouse] ([WarehouseName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_Join] CHECK CONSTRAINT [FK_StockTransfer_Warehouse]
GO
ALTER TABLE [dbo].[StockTransfer_Join_W2W]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Join_W2W_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_Join_W2W] CHECK CONSTRAINT [FK_StockTransfer_Join_W2W_Product]
GO
ALTER TABLE [dbo].[StockTransfer_Join_W2W]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_Join_W2W_StockTransfer_W2W] FOREIGN KEY([StockTransferID])
REFERENCES [dbo].[StockTransfer_W2W] ([ST_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_Join_W2W] CHECK CONSTRAINT [FK_StockTransfer_Join_W2W_StockTransfer_W2W]
GO
ALTER TABLE [dbo].[StockTransfer_W2W]  WITH CHECK ADD  CONSTRAINT [FK_StockTransfer_W2W_Warehouse] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouse] ([WarehouseName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StockTransfer_W2W] CHECK CONSTRAINT [FK_StockTransfer_W2W_Warehouse]
GO
ALTER TABLE [dbo].[TaxMaster]  WITH CHECK ADD  CONSTRAINT [FK_TaxMaster_TaxType] FOREIGN KEY([TaxType])
REFERENCES [dbo].[TaxType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TaxMaster] CHECK CONSTRAINT [FK_TaxMaster_TaxType]
GO
ALTER TABLE [dbo].[Temp_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock] CHECK CONSTRAINT [FK_Temp_Stock_Product]
GO
ALTER TABLE [dbo].[Temp_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock_Warehouse] FOREIGN KEY([Warehouse])
REFERENCES [dbo].[Warehouse] ([WarehouseName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock] CHECK CONSTRAINT [FK_Temp_Stock_Warehouse]
GO
ALTER TABLE [dbo].[Temp_Stock_Company]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock_Store_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock_Company] CHECK CONSTRAINT [FK_Temp_Stock_Store_Product]
GO
ALTER TABLE [dbo].[Voucher_OtherDetails]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_OtherDetails_Expense] FOREIGN KEY([Particulars])
REFERENCES [dbo].[Expense] ([ExpenseName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Voucher_OtherDetails] CHECK CONSTRAINT [FK_Voucher_OtherDetails_Expense]
GO
ALTER TABLE [dbo].[Voucher_OtherDetails]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_OtherDetails_Voucher] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Voucher_OtherDetails] CHECK CONSTRAINT [FK_Voucher_OtherDetails_Voucher]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_WarehouseType] FOREIGN KEY([WarehouseType])
REFERENCES [dbo].[WarehouseType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_WarehouseType]
GO
USE [master]
GO
ALTER DATABASE [RetailPOS_DB] SET  READ_WRITE 
GO
