const express = require('express');
const app = express();

// Replace these HWIDs with actual values you want to allow
const allowedHWIDs = [
    '2A1B112A1C3322C2211A',
    '1CaAAabBAcC1B2bBA2ca',
    'bbBba2abAC3bac1Ac32C',
    'cCcc2b22b2cca23cCAa',
    'a2cC23ABC3C3ACC3aB1b',
    'c3abc3Ac3cca2bbaCaAA',
    '8FJSC1GyqwqzeDdxyGOb',
    'm1726m2dKqUQcP4pXTra',
    'URElmoXjzT6jp;iHjQna',
    'VsIGagVDvCQ6q2K8UpXH',
    '56BnXzKbE9vISdRxJAT',
    'Qc3gUrVMvMImd3QlvEos',
    'ULrPOsCtJEc3QbN28BP',
    'TftIZd0deWasSFC1OoIp',
    'EIAcHYkeExG34H90jA9L',
    'VGugKfnWEuDu80xTKuuE',
    'Qc3gUrVMvMImd3QlvEos',
    'ULrPOsC;tJEc3QbN28BP',
    'TftIZd0deWasSFC1OoIp',
    'EIAcHYkeExG34H90jA9L',
    'VGugKfnWEuDu80xTKuuE',
    'nKDyjTXGpdpt1HAtkfTm',
    's6sSdbNcjBKlhkoLYR5',
    'hKiToCF4rIVo58RaG7A5',
    'rMfVenRkxJalnuyARMMU',
    'r6d6hAOHDPCGihO3BMRA',
    'IaopBJN2zdcfFWA6m07S',
    'PdJuzaaoLn6IrktIVoQY',
    'qlyYkmqVciuUn3K2er53',
    'GYQ6YFfOK18ctTXG6TJE',
    'jWc8ud9wQWKTbFgv6izx',
    'QS7EAgfv43fDAAeyoU3E',
    'JbLx3lIhx4BeRn3uiYwD',
    'LaduudrHWn1wJAcMvnPP',
    'fSmHxodml9iiJaxLimGY',
    'ZGTcHZwRcvtUdO5cMYfX',
    'ygvL37Y9JpULJB7cS0JR',
    'FnkQTsE6HVqXAo4K4zH3',
    '2NjIGiTUluCePAv8jno4',
    'E4JnfEhLXCuK1EKSVSck',
    'kAp7oK3f5s86kTJydAik',
    'RWK2ciQbIZHYYIxBZO8U',
    'GKM7KDR0aI3wIWG0jgvP',
    'xdD4ceS6W0LbV2YmhQTY',
    'f4UcMwPrqmjxOrsF4y3P',
    '9xJqUTNDpt07KBUIolbE',
    's6ozpqv2Kam0cCT9LhCX',
    'ayzG93WcQdyXiWvee9RC',
    'Zswvivi8VF0b2UHIrKGL',
    'f8vhDA61kw5YbeS8eCGB',
    'sLrmn0i4psNko0Itw0ZA'
];

app.get('/validate', (req, res) => {
    const hwid = req.query.hwid;

    if (!hwid) {
        return res.status(400).send('Missing HWID');
    }

    if (allowedHWIDs.includes(hwid)) {
        return res.send('valid');
    } else {
        return res.send('invalid');
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`HWID Server running on port ${PORT}`);
});
