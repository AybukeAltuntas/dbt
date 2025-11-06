select
    products_id
    , cast(purchSE_PRICE as Float64) as purchase_price
from {{ source('raw', 'products')}}