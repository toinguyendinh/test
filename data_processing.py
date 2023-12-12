import numpy as np

with open("data_input_15.txt", "r") as txt_file:
    input_data = [list(map(str, line.split())) for line in txt_file];
txt_file.close()

clk = [row[0] for row in input_data]
clk = list(map(int, clk))

out_adc = []
for i in range(0, len(clk) - 1):
    if clk[i] > clk[i+1]:
        out_adc.append(input_data[i+1])
out_adc_np = np.asarray(out_adc, dtype=np.float32)

idx = out_adc_np >= 1.5
not_idx = out_adc_np < 1.5

out_adc_np[idx] = 1
out_adc_np[not_idx] = 0

out_adc = np.delete(out_adc_np, 0, 1)
np.savetxt("data_input_15_final.txt", out_adc, fmt='%d', delimiter='', newline='\n')

sum_data = np.sum(out_adc_np, axis=1, dtype=int)
np.savetxt("data_input_15_final_sum.txt", sum_data, fmt="%d")
