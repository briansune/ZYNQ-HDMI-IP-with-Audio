`timescale 1ns / 1ns

module hdmi_top#(
	parameter no_codec = 1'b0
)(
	
    input					clk_pixel,
    input					clk_pixel_x5,
    input					sys_nrst,
	
    input					hsync,
    input					vsync,
    input					den,
    input		[23 : 0]	rgb_in,
	
    input		[15 : 0]	audio_l,
    input		[15 : 0]	audio_r,
	
	output		[1 : 0]		hdmi_clk,
	output		[1 : 0]		hdmi_d0,
	output		[1 : 0]		hdmi_d1,
	output		[1 : 0]		hdmi_d2,
	
	output 				hdmi_cec,
	input				hdmi_hdp,
	output 				hdmi_scl,
	output 				hdmi_sda
);
	
	wire tmds_ck;
	wire [2 : 0] tmds_d;
	
	assign hdmi_sda = 1'b1;
	assign hdmi_scl = 1'b1;
	assign hdmi_cec = 1'b1;
	
	hdmi#(
		.VIDEO_ID_CODE(16),
		.VIDEO_REFRESH_RATE(59.94),
		.AUDIO_RATE(48000),
		.AUDIO_BIT_WIDTH(16),
		.DVI_OUTPUT(no_codec)
	)hdmi(
		.clk_pixel_x5		(clk_pixel_x5),
		.clk_pixel			(clk_pixel),
		.clk_audio			(clk_pixel),
		.reset				(!sys_nrst),
		
		.audio_l			(audio_l),
		.audio_r			(audio_r),
		.tmds				(tmds_d),
		.tmds_clock			(tmds_ck),
		
		.rgb				({rgb_in[16+:8], rgb_in[0+:8], rgb_in[8+:8]}),
		
		.hsync_in			(hsync),
		.vsync_in			(vsync),
		.den_in				(den)
	);

	OBUFDS #(
		.IOSTANDARD	("TMDS_33"),
		.SLEW		("FAST")
	)OBUFDS_inst0(
		.I		(tmds_ck),
		.O		(hdmi_clk[1]),
		.OB		(hdmi_clk[0])
	);

	OBUFDS #(
		.IOSTANDARD	("TMDS_33"),
		.SLEW		("FAST")
	)OBUFDS_inst1(
		.I		(tmds_d[0]),
		.O		(hdmi_d0[1]),
		.OB		(hdmi_d0[0])
	);

	OBUFDS #(
		.IOSTANDARD	("TMDS_33"),
		.SLEW		("FAST")
	)OBUFDS_inst2(
		.I		(tmds_d[1]),
		.O		(hdmi_d1[1]),
		.OB		(hdmi_d1[0])
	);

	OBUFDS #(
		.IOSTANDARD	("TMDS_33"),
		.SLEW		("FAST")
	)OBUFDS_inst3(
		.I		(tmds_d[2]),
		.O		(hdmi_d2[1]),
		.OB		(hdmi_d2[0])
	);
	
endmodule
