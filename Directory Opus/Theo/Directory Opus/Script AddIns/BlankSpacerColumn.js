function OnInit(initData) {
    initData.name = 'BlankSpacer';
    initData.version = '1.0.0';
    initData.copyright = '';
    initData.desc = 'Adds blank metadata coumn';
    initData.default_enable = true;
    initData.min_version = '12.0';
}

function OnAddColumns(addColData) {
    var col = addColData.AddColumn();
    col.method = 'OnColumn';
    col.name = 'Blank Spacer';
    col.label = 'Blank Spacer';
    col.header = ' ';
    col.justify = 'center';
    col.defwidth = 2;
    col.autorefresh = 1;
    col.autogroup = true;
}