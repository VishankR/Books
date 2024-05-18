function OnInit(initData)
{
	initData.name = "SHA-256 and SHA-512";
	initData.version = "2.1";
	initData.copyright = "(c) 2019-2021 Leo Davidson";
	initData.url = "https://resource.dopus.com/t/column-sha-256/33525/1";
	initData.desc = "SHA-256 and SHA-512 hash columns";
	initData.default_enable = true;
	initData.min_version = "12.23";
}

function OnAddColumns(addColData)
{
	AddColumn(addColData, "SHA256", "SHA256", "sha256");
	AddColumn(addColData, "SHA512", "SHA512", "sha512");
}

function AddColumn(addColData, colName, colLabel, hashName)
{
	var col = addColData.AddColumn();

	col.name = colName;
	col.label = colLabel;

	col.method = "OnColumns";
	col.multicol = false;

	col.justify = "left";
	col.autogroup = true;
	col.autorefresh = true;

	// Setting the timeout to zero tells Opus to Wait for us forever without giving up.
	// Hashing large files can take a long time.
	col.timeout = 0;
	
	col.userdata = hashName;
}

// Implement the columns
function OnColumns(scriptColData)
{
	try
	{
		var item = scriptColData.item;
		if (item.is_dir) return;

		var algorithm = scriptColData.userdata;
		var hash = DOpus.FSUtil().Hash(scriptColData.item.realpath, algorithm);

		scriptColData.value = hash;
	}
	catch(e)
	{
		scriptColData.value = "";
	}
}
