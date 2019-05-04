#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu          {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu       {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator            {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                    {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file   {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox    {raw => q(xml data)},
    begin_cat: beginning of a category              {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                    {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                {exit => ["label", "icon"]},

=cut

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [
    # Format:  NAME, LABEL, ICON
{sep => " Gentoo    Openbox "},
    {item => ['exo-open --launch TerminalEmulator', '  Terminale', 'terminal-emulator']},
    {item => ['exo-open --launch WebBrowser ',       '  Web Browser', 'web-browser']},
    {item => ['exo-open --launch FileManager',         '  File Manager', 'file-manager']},
    {item => ['menu  -r', '  Esegui',                          'rofi']},
{sep => 'Categorie  '},
      {cat => ['utility',            '    Accessori',       'applications-utilities']},
      {cat => ['development', '    Sviluppo',         'applications-development']},
      {cat => ['game',            '    Giochi',             'applications-games']},
      {cat => ['graphics',        '    Grafica',           'applications-graphics']},
      {cat => ['audiovideo',    '    Multimedia',      'applications-multimedia']},
      {cat => ['network',        '    Network',          'applications-internet']},
      {cat => ['office',            '    Ufficio',             'applications-office']},
      {cat => ['other',            '    Altro',                'applications-other']},
      {cat => ['settings',        '    Impostazioni',    'applications-accessories']},
      {cat => ['system',         '    Sistema',           'applications-system']},
    {pipe => ['places-pipemenu --recent ~/', '    File  Recenti', 'folder']},
{sep => 'Avanzate'},
      {begin_cat => ['  Configurazioni ', 'theme']},
      {begin_cat => ['  Openbox', 'openbox']},  
        {item => ['obconf', ' Openbox Conf', 'theme']},
 #       {item => ['kickshaw', ' GUI Menu Editor', 'openbox']},
 #       {item => ['obkey', ' GUI Tastiera', 'openbox']},
 #       {item => ['ob-autostart', ' GUI Autostart', 'openbox']},
        {item => ["$editor ~/.config/obmenu-generator/schema.pl", ' Edita Schema.pl', 'text-x-source']},
        {item => ["exo-open ~/.config/openbox/menu.xml", ' Edita menu.xml', 'text-xml']},
        {item => ["exo-open ~/.config/openbox/rc.xml", ' Edita rc.xml', 'text-xml']},
        {item => ["exo-open ~/.config/openbox/autostart", ' Edita autostart', 'text-xml']},
        {item => ['obmenu-generator -s -c', ' Rigenera Menu ', 'menu-editor']},
    {end_cat => undef},
      {pipe => ['polybar-pipemenu', ' Polybar', 'polybar']},
      {pipe => ['conky-pipemenu', ' Conky', 'conky']},
      {pipe => ['tint2-pipemenu', ' Tint2', 'tint2']},
      {pipe => ['compositor', ' Compositore', 'compton']},
    {begin_cat => [' Sistema', 'system-settings']},
        {item => ['lxappearance', ' Aspetto-LX', 'theme']},
        {item => ['xfce4-appearance-settings', ' Aspetto-XFCE', 'theme']},
        {item => ['pnmixer', ' Imposta Audio', 'multimedia-volume-control']},
        {item => ['sudo porthole', ' Gestore Software', 'gnome-software']},
        {item => ['arandr', ' Schermo', 'xfce4-display-settings']},
        {item => ['xfce4-settings-manager', ' Settings Manager', 'xfce4-settings-manager']},
    {end_cat => undef},
{sep => ' '},
      {item => ['nitrogen', ' Cambia Wallpaper', 'nitrogen']},
      {item => ['rofi-theme-selector', ' Rofi Theme', 'theme']},
      {item => ['panel-chooser', ' Scegli il Panello', 'panel']},
    {end_cat => undef},
    {pipe => ['kb-pipemenu',   '  Scorciatoie KB', 'cs-keyboard']},
    {pipe => ['info-pipemenu', '  Info  Online ', 'info']},
    {item => ['obmenu-generator -s -c', '  Rigenera Menu ', 'menu-editor']},
    {item => ['openbox --exit', '  Esci da Openbox', 'exit']},
    {sep => '  '},
    ]
