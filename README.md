# ZYNQ-HDMI-IP-with-Audio

This is an open-source HDMI IP via TMDS standard.

This IP does not require any additional IC and purely used the FPGA IO only.

The audio sampling is fixed to 48k, if user would like other settings. Please modify the SV.

This IP is greated under 2020.2 Vivado.

<img src="https://user-images.githubusercontent.com/29487339/194732643-1b485f9a-31bc-45f9-87b2-4922fde414e5.png" style="height:75%; width:75%" >

# IP Usage - With Audio 

| Res    | Usage | Total  | %          |
|--------|-------|--------|------------|
| LUT    | 575   | 277400 | 0.2072819  |
| LUTRAM | 1     | 108200 | 0.01       |
| FF     | 608   | 554800 | 0.10958904 |
| IO     | 11    | 362    | 3.038674   |
| BUFG   | 4     | 32     | 12.5       |
| MMCM   | 1     | 8      | 12.5       |

# IP Usage - w/o Audio

| Res    | Usage | Total  | %          |
|--------|-------|--------|------------|
| LUT    | 575   | 277400 | 0.2072819  |
| LUTRAM | 1     | 108200 | 0.01       |
| FF     | 608   | 554800 | 0.10958904 |
| IO     | 11    | 362    | 3.038674   |
| BUFG   | 4     | 32     | 12.5       |
| MMCM   | 1     | 8      | 12.5       |
