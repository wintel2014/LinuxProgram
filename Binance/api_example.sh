curl -X GET "https://api.binance.com/api/v3/time"

curl -X GET "https://api.binance.com/api/v3/exchangeInfo" | python -m json.tool | less
curl -X GET "https://api.binance.com/api/v3/depth" | python -m json.tool | less
curl -X GET "https://api.binance.com/api/v3/ticker/24hr?symbol=BTCUSDT" 2>/dev/null | python -m json.tool


curl -X GET "https://api.binance.com/api/v3/exchangeInfo" 2>/dev/null | python -m json.tool | grep symbol | grep BTCUSD
            "symbol": "BTCUSDT"
            "symbol": "BTCUSDC"
            "symbol": "BTCUSDS"
curl -X GET "https://api.binance.com/api/v3/depth?symbol=BTCUSDT&limit=5" 2>/dev/null |python -m json.tool
{
    "asks": [
        [
            "51972.36000000",
            "0.64293400"
        ],
        .........
    ],
    "bids": [
        [
            "51972.35000000",
            "0.55545100"
        ],
        .........
    ],
    "lastUpdateId": 8853194051
}

 curl -X GET "https://api.binance.com/api/v3/depth?symbol=BTCUSDC&limit=5" 2>/dev/null |python -m json.tool
{
    "asks": [
        [
            "51763.54000000",
            "0.06000000"
        ],
        .........
    ],
    "bids": [
        [
            "51731.10000000",
            "0.04581000"
        ],
        .........

    ],
    "lastUpdateId": 632574910
}

curl -X GET "https://api.binance.com/api/v3/depth?symbol=USDCUSDT&limit=5" 2>/dev/null |python -m json.tool
{
    "asks": [
        [
            "0.99970000",
            "401864.54000000"
        ],
        .........
    ],
    "bids": [
        [
            "0.99960000",
            "166087.69000000"
        ],
        .........
    ],
    "lastUpdateId": 115350016
}


