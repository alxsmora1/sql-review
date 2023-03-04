IF OBJECT_ID(N'stg.PER_TX_CANALES_CXM_TEN', N'U') IS NOT NULL
	TRUNCATE TABLE [stg].[PER_TX_CANALES_CXM_TEN];

CREATE TABLE stg.per_tx_canales_cxm_ten (
    id_buc int NOT NULL,
    cxm_mx_det_ten_canalid uniqueidentifier NULL,
);
