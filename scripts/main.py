import pandas as pd
import os
df = pd.read_excel("../horarios.xlsx")
materias = df.iloc[:].values.tolist()
for mtr in materias:
    mtr = mtr[0]
    os.mkdir(f"../{mtr}")
