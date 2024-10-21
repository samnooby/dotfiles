{ lib, config, pkgs, inputs, ... }:

let
  cfg = config.applications.vscode;
in
{
  options.applications.vscode.enable = lib.mkEnableOption "Enable vscode editor module";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      userSettings = {
        "debug.toolBarLocation" = "docked";

        "editor.cursorBlinking" = "phase";
        "editor.cursorStyle" = "block";
        "editor.fontLigatures" = false;
        "editor.lineHeight" = 24;
        "editor.fontSize" = 14;
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
        "editor.formatOnSaveMode" = "modificationsIfAvailable";
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.minimap.autohide" = true;
        "editor.minimap.enabled" = true;

        "workbench.editor.alwaysShowEditorActions" = true;
        "workbench.editor.decorations.badges" = true;
        "workbench.editor.editorActionsLocation" = "default";
        "workbench.editor.highlightModifiedTabs" = true;
        "workbench.editor.labelFormat" = "short";
        "workbench.editor.limit.enabled" = true;
        "workbench.editor.limit.value" = 7;
        "workbench.editor.openPositioning" = "right";
        "workbench.editor.showIcons" = true;
        "workbench.editor.showTabs" = "multiple";
        "workbench.editor.splitInGroupLayout" = "horizontal";
        "workbench.editor.splitOnDragAndDrop" = true;
        "workbench.editor.tabActionCloseVisibility" = false;
        "workbench.editor.tabSizing" = "fixed";
        "workbench.editor.wrapTabs" = false;

        "workbench.iconTheme" = "material-icon-theme";
        "workbench.externalBrowser" = "firefox";
        "workbench.layoutControl.enabled" = true;
        "workbench.layoutControl.type" = "both";
        "workbench.sash.size" = 8;
        "workbench.activityBar.location" = "top";
        "workbench.sideBar.location" = "right";
        "workbench.statusBar.visible" = true;
        "workbench.tree.enableStickyScroll" = true;
        "workbench.tree.expandMode" = "singleClick";
        "workbench.tree.indent" = 6;
        "workbench.tree.renderIndentGuides" = "always";
        "workbench.view.alwaysShowHeaderActions" = true;

        "breadcrumbs.enabled" = true;
        "breadcrumbs.icons" = true;
        "breadcrumbs.showArrays" = true;
        "breadcrumbs.showBooleans" = true;
        "breadcrumbs.showClasses" = true;
        "breadcrumbs.showConstants" = true;
        "breadcrumbs.showConstructors" = true;
        "breadcrumbs.showEnumMembers" = true;
        "breadcrumbs.showEnums" = true;
        "breadcrumbs.showEvents" = true;
        "breadcrumbs.showFields" = true;
        "breadcrumbs.showFiles" = true;
        "breadcrumbs.showFunctions" = true;
        "breadcrumbs.showInterfaces" = true;
        "breadcrumbs.showKeys" = true;
        "breadcrumbs.showMethods" = true;
        "breadcrumbs.showModules" = true;
        "breadcrumbs.showNamespaces" = true;
        "breadcrumbs.showNull" = true;
        "breadcrumbs.showNumbers" = true;
        "breadcrumbs.showObjects" = true;
        "breadcrumbs.showOperators" = true;
        "breadcrumbs.showPackages" = true;
        "breadcrumbs.showVariables" = true;
        "breadcrumbs.showTypeParameters" = true;
        "breadcrumbs.showStructs" = true;
        "breadcrumbs.showStrings" = true;
        "breadcrumbs.showProperties" = true;

        "explorer.decorations.colors" = true;
        "explorer.decorations.badges" = true;
        "explorer.copyRelativePathSeparator" = "auto";
        "explorer.compactFolders" = true;
        "explorer.fileNesting.enabled" = false;
        "explorer.fileNesting.expand" = false;
        "explorer.incrementalNaming" = "smart";
        "outline.icons" = true;

        "window.commandCenter" = true;
        "window.density.editorTabHeight" = "default";
        # "window.title" = "${rootName}${separator}${activeEditorShort}";
      };
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        github.copilot
        github.copilot-chat
        pkief.material-icon-theme
        sswg.swift-lang
      ];
    };
  };
}
