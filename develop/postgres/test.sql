IF OBJECT_ID(N'stg.PER_TX_CANALES_CXM_TEN', N'U') IS NOT NULL
       TRUNCATE TABLE [stg].[PER_TX_CANALES_CXM_TEN];  

CREATE TABLE stg.PER_TX_CANALES_CXM_TEN (
	ID_BUC int NOT NULL,
	cxm_mx_det_ten_canalid uniqueidentifier NULL,,
);