select
    *
from 
    {{ source('fufu_republic', 'orders') }}