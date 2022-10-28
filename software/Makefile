init:
	xsct -eval "setws $(WORKSPACE); \
		platform create -name $(plat_name) -hw $(XSA); \
		domain create -name $(domain_name_apu) -os standalone -proc ps7_cortexa9_0; \
		app create -name $(app_name_apu) -platform $(plat_name) -domain $(domain_name_apu) -sysproj $(sys_name) -template {Hello World}; \
		platform active $(plat_name); \
		platform generate; \
		app build $(app_name_apu)"