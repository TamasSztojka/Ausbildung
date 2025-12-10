using System;
using System.Collections.Generic;
using System.Text;

namespace LE_03_01_Mietwagenfirma
{
    internal interface ILoanCalculate
    {
        decimal calculateLoanPrice(int days);
    }
}
