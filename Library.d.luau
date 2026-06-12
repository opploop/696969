--!strict
-- Luau type definitions for the Obsidian UI Library

--// Helper & Configuration Types
export type Scheme = {
    BackgroundColor: Color3,
    MainColor: Color3,
    AccentColor: Color3,
    OutlineColor: Color3,
    FontColor: Color3,
    Font: Font,
    RedColor: Color3,
    DestructiveColor: Color3,
    DarkColor: Color3,
    WhiteColor: Color3,
}

export type RainbowBorderTarget = "Window" | "Groupboxes" | "DependencyGroupboxes" | "Tabboxes" | "Cards" | "Popups"

export type RainbowBorderTargets = {
    Window: boolean?,
    Groupboxes: boolean?,
    DependencyGroupboxes: boolean?,
    Tabboxes: boolean?,
    Cards: boolean?,
    Popups: boolean?,
}

export type TabTitleMode = "Active" | "Window" | "Hidden"

export type Icon = {
    Url: string,
    ImageRectOffset: Vector2,
    ImageRectSize: Vector2,
}

export type CustomFontGlyph = {
    Image: string,
    X: number,
    Y: number,
    Width: number,
    Height: number,
    XOffset: number,
    YOffset: number,
    XAdvance: number,
}

export type CustomFont = {
    Type: "CustomFont",
    Name: string,
    Pages: { string },
    Glyphs: { [string]: CustomFontGlyph },
    Size: number,
    LineHeight: number,
    Space: number,
    SourceUrl: string?,
    GetTextBounds: (self: CustomFont, Text: string, TextSize: number?, Width: number?) -> (number, number),
}

export type CustomFontManager = {
    Download: (self: CustomFontManager, Url: string, Options: { [string]: any }?) -> CustomFont,
    Register: (self: CustomFontManager, FontInfo: { [string]: any }) -> CustomFont,
}

export type DownloadAssetInfo = {
    FileName: string?,
    Name: string?,
    AssetName: string?,
    Folder: string?,
    Extension: string?,
    RobloxAssetId: number?,
    ForceRedownload: boolean?,
}

export type CustomFontText = {
    Font: CustomFont,
    Text: string,
    TextSize: number,
    TextColor3: Color3,
    TextTransparency: number,
    TextXAlignment: Enum.TextXAlignment,
    TextYAlignment: Enum.TextYAlignment,
    TextWrapped: boolean,
    Visible: boolean,
    Holder: Frame,
    Type: string?,

    Render: (self: CustomFontText) -> (),
    SetText: (self: CustomFontText, Text: string) -> (),
    SetFont: (self: CustomFontText, Font: CustomFont) -> (),
    SetColor: (self: CustomFontText, Color: Color3) -> (),
    SetVisible: (self: CustomFontText, Visible: boolean) -> (),
    SetHeight: ((self: CustomFontText, Height: number) -> ())?,
    Destroy: (self: CustomFontText) -> (),
}

export type ContextMenu = {
    Active: boolean,
    Holder: GuiObject,
    Menu: GuiObject,
    List: UIListLayout?,
    Signal: RBXScriptConnection?,
    Size: UDim2 | () -> UDim2,

    Open: (self: ContextMenu) -> (),
    Close: (self: ContextMenu) -> (),
    Toggle: (self: ContextMenu) -> (),
    SetSize: (self: ContextMenu, Size: UDim2 | () -> UDim2) -> (),
}

export type Tooltip = {
    Disabled: boolean,
    Hovering: boolean,
    Signals: { [number]: RBXScriptConnection },
    Destroy: (self: Tooltip) -> (),
}

export type NotificationAction = {
    Text: string,
    Callback: ((any) -> ())?,
    Func: ((any) -> ())?,
    CloseOnClick: boolean?,
    Risky: boolean?,
}

export type NotificationVariant = "Info" | "Success" | "Warning" | "Error"

export type NotificationInfo = {
    Title: string?,
    Description: string?,
    Time: number | Instance?,
    SoundId: string | number?,
    Steps: number?,
    Persist: boolean?,
    Icon: string?,
    BigIcon: string?,
    IconColor: Color3 | string?,
    AccentColor: Color3 | string?,
    Type: NotificationVariant?,
    Variant: NotificationVariant?,
    Progress: number?,
    Actions: { NotificationAction }?,
    CloseButton: boolean?,
    Dismissible: boolean?,
}

export type Notification = NotificationInfo & {
    Description: string?,
    Time: number | Instance,
    Destroyed: boolean,

    Resize: (self: Notification) -> (),
    ChangeTitle: (self: Notification, Text: string) -> (),
    ChangeDescription: (self: Notification, Text: string) -> (),
    ChangeStep: (self: Notification, NewStep: number) -> (),
    SetProgress: (self: Notification, Progress: number) -> (),
    Destroy: (self: Notification) -> (),
}

export type KeybindToggle = {
    Normal: boolean,
    Holder: TextButton,
    Label: TextLabel,
    Checkbox: Frame,
    Track: Frame?,
    Knob: Frame?,
    Loaded: boolean,

    Display: (self: KeybindToggle, State: boolean) -> (),
    SetText: (self: KeybindToggle, Text: string) -> (),
    SetVisibility: (self: KeybindToggle, Visibility: boolean) -> (),
    SetNormal: (self: KeybindToggle, Normal: boolean) -> (),
}

export type DraggableLabel = {
    Label: TextLabel,
    SetText: (self: DraggableLabel, Text: string) -> (),
    SetVisible: (self: DraggableLabel, Visible: boolean) -> (),
}

export type DraggableButton = {
    Button: TextButton,
    SetText: (self: DraggableButton, Text: string) -> (),
}

export type DraggableMenuInfo = {
    Width: number?,
    Height: number?,
    MaxHeight: number?,
    MaximumHeight: number?,
    Size: UDim2?,
}

export type KeybindMenuButtonInfo = {
    Text: string?,
    Func: ((any) -> ())?,
    Callback: ((any) -> ())?,
    Height: number?,
    TextSize: number?,
    Transparency: number?,
    StrokeColor: Color3 | string?,
    StrokeTransparency: number?,
    GradientRotation: number?,
    GradientTransparency: NumberSequence?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type KeybindMenuButton = {
    Text: string,
    Disabled: boolean,
    Visible: boolean,
    Callback: (any) -> (),
    Type: "KeybindMenuButton",
    Holder: TextButton,
    Label: TextLabel,
    SetText: (self: KeybindMenuButton, Text: string) -> (),
    SetDisabled: (self: KeybindMenuButton, Disabled: boolean) -> (),
    SetVisible: (self: KeybindMenuButton, Visible: boolean) -> (),
}

export type KeybindMenuToggleInfo = {
    Text: string?,
    Default: boolean?,
    Callback: ((boolean) -> ())?,
    Changed: ((boolean) -> ())?,
    Height: number?,
    TextSize: number?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type KeybindMenuToggle = {
    Text: string,
    Value: boolean,
    Disabled: boolean,
    Visible: boolean,
    Callback: (boolean) -> (),
    Changed: (boolean) -> (),
    Type: "KeybindMenuToggle",
    Holder: TextButton,
    Track: Frame,
    Knob: Frame,
    Label: TextLabel,
    Display: (self: KeybindMenuToggle) -> (),
    SetValue: (self: KeybindMenuToggle, Value: boolean) -> (),
    OnChanged: (self: KeybindMenuToggle, Func: (boolean) -> ()) -> (),
    SetText: (self: KeybindMenuToggle, Text: string) -> (),
    SetDisabled: (self: KeybindMenuToggle, Disabled: boolean) -> (),
    SetVisible: (self: KeybindMenuToggle, Visible: boolean) -> (),
}

--// Element Creation Info Types
export type ButtonInfo = {
    Text: string,
    Func: () -> (),
    DoubleClick: boolean?,
    Tooltip: string?,
    DisabledTooltip: string?,
    Risky: boolean?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type ToggleInfo = {
    Text: string,
    Default: boolean?,
    Callback: ((boolean) -> ())?,
    Changed: ((boolean) -> ())?,
    Tooltip: string?,
    DisabledTooltip: string?,
    Risky: boolean?,
    Disabled: boolean?,
    Visible: boolean?,
    ActionsMenu: boolean?,
    ActionMenu: boolean?,
    KeybindMenu: boolean?,
    KeybindMenuText: string?,
    KeybindMenuIdx: string?,
    KeybindMenuId: string?,
}

export type InputInfo = {
    Text: string,
    Default: string?,
    Finished: boolean?,
    Numeric: boolean?,
    ClearTextOnFocus: boolean?,
    Placeholder: string?,
    AllowEmpty: boolean?,
    EmptyReset: string?,
    MaxLength: number?,
    Tooltip: string?,
    DisabledTooltip: string?,
    Callback: ((string) -> ())?,
    Changed: ((string) -> ())?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type SliderInfo = {
    Text: string,
    Default: number?,
    Min: number?,
    Max: number?,
    Rounding: number?,
    Prefix: string?,
    Suffix: string?,
    Compact: boolean?,
    HideMax: boolean?,
    FormatDisplayValue: ((Slider, number) -> string)?,
    Tooltip: string?,
    DisabledTooltip: string?,
    Callback: ((number) -> ())?,
    Changed: ((number) -> ())?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type GlassPanelInfo = {
    Title: string?,
    Text: string?,
    Description: string?,
    Desc: string?,
    Icon: string?,
    Badge: string?,
    Height: number?,
    AccentColor: Color3 | string?,
    BackgroundColor: Color3 | string?,
    Transparency: number?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    ShadowTransparency: number?,
    Gradient: boolean?,
    GradientColorSequence: ColorSequence?,
    GradientTransparency: NumberSequence?,
    GradientRotation: number?,
    RainbowBorder: boolean?,
    Visible: boolean?,
}

export type NewElementButtonInfo = {
    Text: string?,
    Func: ((any) -> ())?,
    Callback: ((any) -> ())?,
    Icon: string?,
    Height: number?,
    AccentColor: Color3 | string?,
    BackgroundColor: Color3 | string?,
    Transparency: number?,
    HoverTransparency: number?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    ShadowTransparency: number?,
    GradientColorSequence: ColorSequence?,
    GradientTransparency: NumberSequence?,
    GradientRotation: number?,
    Shine: boolean?,
    ShineColor: Color3 | string?,
    ShineTransparency: number?,
    ShineWidth: number?,
    RainbowBorder: boolean?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type DropdownCardInfo = {
    Text: string?,
    Description: string?,
    Desc: string?,
    Thumbnail: string?,
    BackgroundImage: string?,
    Image: string?,
    Icon: string?,
    BottomBarColor: Color3 | string?,
    BottomBarTransparency: number?,
    BottomBarHeight: number?,
    ImageTransparency: number?,
    ScaleType: Enum.ScaleType?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    GradientColorSequence: ColorSequence?,
    Gradient: ColorSequence?,
    PreviewGradient: ColorSequence?,
    GradientTransparency: NumberSequence?,
    PreviewGradientTransparency: NumberSequence?,
    GradientRotation: number?,
    PreviewGradientRotation: number?,
    PreviewBackgroundColor: Color3 | string?,
    PreviewMainColor: Color3 | string?,
    PreviewAccentColor: Color3 | string?,
    PreviewOutlineColor: Color3 | string?,
    PreviewFontColor: Color3 | string?,
    PreviewSwatches: { Color3 | string }?,
}

export type DropdownInfo = {
    Text: string?,
    Values: { any },
    Default: any,
    DisabledValues: { any }?,
    ValueImages: { [any]: string }?,
    Cards: { [any]: DropdownCardInfo }?,
    Multi: boolean?,
    MaxVisibleDropdownItems: number?,
    CardDropdown: boolean?,
    CardHeight: number?,
    CardBottomBarTransparency: number?,
    CardImageTransparency: number?,
    SpecialType: "Player" | "Team"?,
    ExcludeLocalPlayer: boolean?,
    AllowNull: boolean?,
    Searchable: boolean?,
    FormatDisplayValue: ((any) -> string)?,
    Tooltip: string?,
    DisabledTooltip: string?,
    Callback: ((any) -> ())?,
    Changed: ((any) -> ())?,
    Disabled: boolean?,
    Visible: boolean?,
}

export type ViewportInfo = {
    Object: BasePart | Model,
    Camera: Camera?,
    Clone: boolean?,
    AutoFocus: boolean?,
    Interactive: boolean?,
    Height: number?,
    Visible: boolean?,
}

export type ImageInfo = {
    Image: string,
    Transparency: number?,
    BackgroundTransparency: number?,
    Color: Color3?,
    RectOffset: Vector2?,
    RectSize: Vector2?,
    ScaleType: Enum.ScaleType?,
    Height: number?,
    Visible: boolean?,
}

export type VideoInfo = {
    Video: string,
    FileName: string?,
    Folder: string?,
    Extension: string?,
    ForceRedownload: boolean?,
    Looped: boolean?,
    Playing: boolean?,
    Volume: number?,
    Height: number?,
    Visible: boolean?,
}

export type SpriteInfo = {
    Image: string,
    FileName: string?,
    Folder: string?,
    ForceRedownload: boolean?,
    Frames: { { Offset: Vector2?, Size: Vector2?, ImageRectOffset: Vector2?, ImageRectSize: Vector2? } }?,
    FrameSize: Vector2?,
    FrameCount: number?,
    Columns: number?,
    Fps: number?,
    FPS: number?,
    Loop: boolean?,
    Playing: boolean?,
    Transparency: number?,
    BackgroundTransparency: number?,
    Color: Color3?,
    ScaleType: Enum.ScaleType?,
    Height: number?,
    Visible: boolean?,
}

export type UIPassthroughInfo = {
    Instance: GuiBase2d,
    Height: number?,
    Visible: boolean?,
}

export type KeyPickerInfo = {
    Text: string,
    Default: string?,
    Mode: "Always" | "Toggle" | "Hold" | "Press"?,
    Modes: { "Always" | "Toggle" | "Hold" | "Press" }?,
    SyncToggleState: boolean?,
    NoUI: boolean?,
    WaitForCallback: boolean?,
    Callback: ((boolean) -> ())?,
    ChangedCallback: ((Enum.KeyCode | Enum.UserInputType) -> ())?,
    Changed: ((Enum.KeyCode | Enum.UserInputType) -> ())?,
    Clicked: (() -> ())?,
}

export type ColorPickerInfo = {
    Default: Color3?,
    Transparency: number?,
    Title: string?,
    Callback: ((Color3) -> ())?,
    Changed: ((Color3) -> ())?,
}

--// Addon Types
export type KeyPicker = {
    Text: string,
    Value: string,
    Toggled: boolean,
    Mode: "Always" | "Toggle" | "Hold" | "Press",
    SyncToggleState: boolean,
    Callback: (Toggled: boolean) -> (),
    ChangedCallback: (Key: Enum.KeyCode | Enum.UserInputType) -> (),
    Changed: (Key: Enum.KeyCode | Enum.UserInputType) -> (),
    Clicked: () -> (),
    Type: "KeyPicker",
    Menu: ContextMenu,

    Display: (self: KeyPicker) -> (),
    Update: (self: KeyPicker) -> (),
    GetState: (self: KeyPicker) -> boolean,
    OnChanged: (self: KeyPicker, Func: (Key: Enum.KeyCode | Enum.UserInputType) -> ()) -> (),
    OnClick: (self: KeyPicker, Func: () -> ()) -> (),
    DoClick: (self: KeyPicker) -> (),
    SetValue: (self: KeyPicker, Data: { string }) -> (),
    SetText: (self: KeyPicker, Text: string) -> (),
}

export type ColorPicker = {
    Value: Color3,
    Transparency: number,
    Title: string?,
    Callback: (Value: Color3) -> (),
    Changed: (Value: Color3) -> (),
    Type: "ColorPicker",
    Hue: number,
    Sat: number,
    Vib: number,
    ColorMenu: ContextMenu,
    ContextMenu: ContextMenu,

    SetHSVFromRGB: (self: ColorPicker, Color: Color3) -> (),
    Display: (self: ColorPicker) -> (),
    Update: (self: ColorPicker) -> (),
    OnChanged: (self: ColorPicker, Func: (Value: Color3) -> ()) -> (),
    SetValue: (self: ColorPicker, HSV: { number }, Transparency: number?) -> (),
    SetValueRGB: (self: ColorPicker, Color: Color3, Transparency: number?) -> (),
}

export type Addon = KeyPicker | ColorPicker

export type GlassPanel = {
    Text: string,
    Title: string,
    Description: string,
    Visible: boolean,
    Type: "GlassPanel",
    Holder: Frame,
    SetTitle: (self: GlassPanel, Text: string) -> (),
    SetDescription: (self: GlassPanel, Text: string) -> (),
    SetVisible: (self: GlassPanel, Visible: boolean) -> (),
}

export type NewElementButton = {
    Text: string,
    Disabled: boolean,
    Visible: boolean,
    Type: "HighlightButton" | "ShinyButton" | "LiquidGlassButton",
    Holder: TextButton,
    SetText: (self: NewElementButton, Text: string) -> (),
    SetDisabled: (self: NewElementButton, Disabled: boolean) -> (),
    SetVisible: (self: NewElementButton, Visible: boolean) -> (),
}

--// Base Element Types
export type Label = {
    Text: string,
    DoesWrap: boolean,
    Addons: { [number]: Addon },
    Visible: boolean,
    Type: "Label",
    TextLabel: TextLabel,
    Container: GuiObject,
    Holder: TextLabel,

    SetVisible: (self: Label, Visible: boolean) -> (),
    SetText: (self: Label, Text: string) -> (),

    -- From BaseAddons
    AddKeyPicker: (self: Label, Idx: string, Info: KeyPickerInfo) -> Label,
    AddColorPicker: (self: Label, Idx: string, Info: ColorPickerInfo) -> Label,
}

export type Button = {
    Text: string,
    Func: () -> (),
    DoubleClick: boolean?,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Risky: boolean,
    Disabled: boolean,
    Visible: boolean,
    Tween: Tween?,
    Type: "Button",
    Base: TextButton,
    Stroke: UIStroke,
    Holder: Frame,
    SubButton: SubButton?,

    AddButton: (self: Button, Info: ButtonInfo | string, Func: (() -> ())?, Idx: string?) -> SubButton,
    Trigger: (self: Button) -> (),
    UpdateColors: (self: Button) -> (),
    SetDisabled: (self: Button, Disabled: boolean) -> (),
    SetVisible: (self: Button, Visible: boolean) -> (),
    SetText: (self: Button, Text: string) -> (),
}

export type SubButton = {
    Text: string,
    Func: () -> (),
    DoubleClick: boolean?,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Risky: boolean,
    Disabled: boolean,
    Visible: boolean,
    Tween: Tween?,
    Type: "SubButton",
    Base: TextButton,
    Stroke: UIStroke,

    Trigger: (self: SubButton) -> (),
    UpdateColors: (self: SubButton) -> (),
    SetDisabled: (self: SubButton, Disabled: boolean) -> (),
    SetVisible: (self: SubButton, Visible: boolean) -> (),
    SetText: (self: SubButton, Text: string) -> (),
}

export type Toggle = {
    Text: string,
    Value: boolean,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Callback: (Value: boolean) -> (),
    Changed: (Value: boolean) -> (),
    Risky: boolean,
    Disabled: boolean,
    Visible: boolean,
    Addons: { [number]: Addon },
    Type: "Toggle",
    TextLabel: TextLabel,
    Container: GuiObject,
    Holder: TextButton,
    ActionsMenu: ContextMenu?,
    ActionsButton: TextButton?,
    KeybindMenuEntry: KeybindMenuToggle?,
    KeybindMenuVisible: boolean?,

    UpdateColors: (self: Toggle) -> (),
    Display: (self: Toggle) -> (),
    OnChanged: (self: Toggle, Func: (Value: boolean) -> ()) -> (),
    SetValue: (self: Toggle, Value: boolean) -> (),
    SetDisabled: (self: Toggle, Disabled: boolean) -> (),
    SetVisible: (self: Toggle, Visible: boolean) -> (),
    SetText: (self: Toggle, Text: string) -> (),
    AddToKeybindMenu: (self: Toggle, Info: ToggleInfo?) -> KeybindMenuToggle,
    RemoveFromKeybindMenu: (self: Toggle) -> (),
    AddActionsMenu: (self: Toggle, Info: ToggleInfo?) -> ContextMenu?,

    -- From BaseAddons
    AddKeyPicker: (self: Toggle, Idx: string, Info: KeyPickerInfo) -> Toggle,
    AddColorPicker: (self: Toggle, Idx: string, Info: ColorPickerInfo) -> Toggle,
}

export type Input = {
    Text: string,
    Value: string,
    Finished: boolean,
    Numeric: boolean,
    ClearTextOnFocus: boolean,
    Placeholder: string,
    AllowEmpty: boolean,
    EmptyReset: string,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Callback: (Value: string) -> (),
    Changed: (Value: string) -> (),
    Disabled: boolean,
    Visible: boolean,
    Type: "Input",
    Holder: Frame,

    UpdateColors: (self: Input) -> (),
    OnChanged: (self: Input, Func: (Value: string) -> ()) -> (),
    SetValue: (self: Input, Text: string) -> (),
    SetDisabled: (self: Input, Disabled: boolean) -> (),
    SetVisible: (self: Input, Visible: boolean) -> (),
    SetText: (self: Input, Text: string) -> (),
}

export type Slider = {
    Text: string,
    Value: number,
    Min: number,
    Max: number,
    Prefix: string,
    Suffix: string,
    Compact: boolean?,
    Rounding: number,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Callback: (Value: number) -> (),
    Changed: (Value: number) -> (),
    Disabled: boolean,
    Visible: boolean,
    Type: "Slider",
    Holder: Frame,

    UpdateColors: (self: Slider) -> (),
    Display: (self: Slider) -> (),
    OnChanged: (self: Slider, Func: (Value: number) -> ()) -> (),
    SetMax: (self: Slider, Value: number) -> (),
    SetMin: (self: Slider, Value: number) -> (),
    SetValue: (self: Slider, Value: number | string) -> (),
    SetDisabled: (self: Slider, Disabled: boolean) -> (),
    SetVisible: (self: Slider, Visible: boolean) -> (),
    SetText: (self: Slider, Text: string) -> (),
    SetPrefix: (self: Slider, Prefix: string) -> (),
    SetSuffix: (self: Slider, Suffix: string) -> (),
}

export type Dropdown = {
    Text: string?,
    Value: { [any]: boolean } | any,
    Values: { any },
    DisabledValues: { any },
    ValueImages: { [any]: string },
    Cards: { [any]: DropdownCardInfo },
    Multi: boolean,
    CardDropdown: boolean,
    CardHeight: number,
    SpecialType: "Player" | "Team"?,
    ExcludeLocalPlayer: boolean?,
    Tooltip: string?,
    DisabledTooltip: string?,
    TooltipTable: Tooltip?,
    Callback: (Value: any) -> (),
    Changed: (Value: any) -> (),
    Disabled: boolean,
    Visible: boolean,
    Type: "Dropdown",
    Menu: ContextMenu,
    Holder: Frame,

    RecalculateListSize: (self: Dropdown, Count: number?) -> (),
    UpdateColors: (self: Dropdown) -> (),
    Display: (self: Dropdown) -> (),
    OnChanged: (self: Dropdown, Func: (Value: any) -> ()) -> (),
    GetActiveValues: (self: Dropdown) -> { any } | number,
    BuildDropdownList: (self: Dropdown) -> (),
    SetValue: (self: Dropdown, Value: any) -> (),
    SetValues: (self: Dropdown, Values: { any }) -> (),
    AddValues: (self: Dropdown, Values: { any } | string) -> (),
    SetDisabledValues: (self: Dropdown, DisabledValues: { any }) -> (),
    AddDisabledValues: (self: Dropdown, DisabledValues: { any } | string) -> (),
    SetValueImages: (self: Dropdown, ValueImages: { [any]: string }) -> (),
    AddValueImages: (self: Dropdown, ValueImages: { [any]: string }) -> (),
    SetCards: (self: Dropdown, Cards: { [any]: DropdownCardInfo }) -> (),
    AddCards: (self: Dropdown, Cards: { [any]: DropdownCardInfo }) -> (),
    SetDisabled: (self: Dropdown, Disabled: boolean) -> (),
    SetVisible: (self: Dropdown, Visible: boolean) -> (),
    SetText: (self: Dropdown, Text: string) -> (),
}

export type Viewport = {
    Object: BasePart | Model,
    Camera: Camera,
    Interactive: boolean,
    AutoFocus: boolean,
    Visible: boolean,
    Type: "Viewport",
    Holder: Frame,

    SetObject: (self: Viewport, Object: Instance, Clone: boolean?) -> (),
    SetHeight: (self: Viewport, Height: number) -> (),
    Focus: (self: Viewport) -> (),
    SetCamera: (self: Viewport, Camera: Camera) -> (),
    SetInteractive: (self: Viewport, Interactive: boolean) -> (),
    SetVisible: (self: Viewport, Visible: boolean) -> (),
}

export type Image = {
    Image: string,
    Color: Color3,
    RectOffset: Vector2,
    RectSize: Vector2,
    Height: number,
    ScaleType: Enum.ScaleType,
    Transparency: number,
    Visible: boolean,
    Type: "Image",
    Holder: Frame,

    SetHeight: (self: Image, Height: number) -> (),
    SetImage: (self: Image, NewImage: string) -> (),
    SetColor: (self: Image, Color: Color3) -> (),
    SetRectOffset: (self: Image, RectOffset: Vector2) -> (),
    SetRectSize: (self: Image, RectSize: Vector2) -> (),
    SetScaleType: (self: Image, ScaleType: Enum.ScaleType) -> (),
    SetTransparency: (self: Image, Transparency: number) -> (),
    SetVisible: (self: Image, Visible: boolean) -> (),
}

export type Video = {
    Video: string,
    SourceUrl: string,
    Looped: boolean,
    Playing: boolean,
    Volume: number,
    Height: number,
    Visible: boolean,
    Type: "Video",
    Holder: Frame,
    VideoFrame: VideoFrame,

    SetHeight: (self: Video, Height: number) -> (),
    SetVideo: (self: Video, NewVideo: string, FileName: string?) -> (),
    SetLooped: (self: Video, Looped: boolean) -> (),
    SetVolume: (self: Video, Volume: number) -> (),
    SetPlaying: (self: Video, Playing: boolean) -> (),
    Play: (self: Video) -> (),
    Pause: (self: Video) -> (),
    SetVisible: (self: Video, Visible: boolean) -> (),
}

export type Sprite = {
    Image: string,
    Frames: { any },
    FrameSize: Vector2?,
    FrameCount: number?,
    Columns: number?,
    Fps: number,
    Loop: boolean,
    Playing: boolean,
    Height: number,
    Transparency: number,
    BackgroundTransparency: number,
    Color: Color3,
    ScaleType: Enum.ScaleType,
    Visible: boolean,
    Type: "Sprite",
    Holder: Frame,
    ImageLabel: ImageLabel,

    Play: (self: Sprite) -> (),
    Stop: (self: Sprite) -> (),
    SetHeight: (self: Sprite, Height: number) -> (),
    SetImage: (self: Sprite, NewImage: string) -> (),
    SetColor: (self: Sprite, Color: Color3) -> (),
    SetTransparency: (self: Sprite, Transparency: number) -> (),
    SetVisible: (self: Sprite, Visible: boolean) -> (),
}

export type FloatingSpriteInfo = SpriteInfo & {
    AnchorPoint: Vector2?,
    Position: UDim2?,
    Size: UDim2?,
    ZIndex: number?,
    Parent: Instance?,
    ParentMode: "Floating" | "Window"?,
}

export type FloatingSprite = {
    Image: string,
    Visible: boolean,
    Playing: boolean,
    Type: "FloatingSprite",
    ImageObject: ImageLabel,

    Play: (self: FloatingSprite) -> (),
    Stop: (self: FloatingSprite) -> (),
    SetImage: (self: FloatingSprite, NewImage: string) -> (),
    SetVisible: (self: FloatingSprite, Visible: boolean) -> (),
    SetPosition: (self: FloatingSprite, Position: UDim2) -> (),
    SetSize: (self: FloatingSprite, Size: UDim2) -> (),
    SetZIndex: (self: FloatingSprite, ZIndex: number) -> (),
    SetParent: (self: FloatingSprite, Parent: Instance) -> (),
    BringToFront: (self: FloatingSprite) -> number,
    Destroy: (self: FloatingSprite) -> (),
}

export type CanvasGradientInfo = {
    Color: ColorSequence?,
    ColorSequence: ColorSequence?,
    Offset: Vector2?,
    Rotation: number?,
    Transparency: NumberSequence?,
}

export type CanvasDrawingInfo = {
    Type: string?,
    Kind: string?,
    Name: string?,
    AnchorPoint: Vector2?,
    BackgroundColor3: Color3 | string?,
    Color: Color3 | string?,
    BackgroundTransparency: number?,
    Transparency: number?,
    Position: UDim2?,
    Rotation: number?,
    Size: UDim2?,
    Visible: boolean?,
    ZIndex: number?,
    CornerRadius: number?,
    Radius: number?,
    Stroke: boolean?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    Text: string?,
    TextColor3: Color3 | string?,
    TextSize: number?,
    TextTransparency: number?,
    TextWrapped: boolean?,
    TextXAlignment: Enum.TextXAlignment?,
    TextYAlignment: Enum.TextYAlignment?,
    Image: string | number?,
    Texture: string | number?,
    Url: string?,
    URL: string?,
    ImageColor3: Color3 | string?,
    ImageTransparency: number?,
    ImageRectOffset: Vector2?,
    ImageRectSize: Vector2?,
    RectOffset: Vector2?,
    RectSize: Vector2?,
    ScaleType: Enum.ScaleType?,
    TileSize: UDim2?,
    Gradient: CanvasGradientInfo?,
}

export type CanvasInfo = {
    Idx: string?,
    Height: number?,
    Visible: boolean?,
    BackgroundColor3: Color3 | string?,
    Color: Color3 | string?,
    BackgroundTransparency: number?,
    Transparency: number?,
    CornerRadius: number?,
    Outline: boolean?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    ShadowTransparency: number?,
    Gradient: CanvasGradientInfo?,
    Drawings: { CanvasDrawingInfo }?,
}

export type Canvas = {
    Height: number,
    Visible: boolean,
    Drawings: { Instance },
    Type: "Canvas",
    Holder: Frame,
    Layer: Frame,

    AddFrame: (self: Canvas, Info: CanvasDrawingInfo?) -> Frame,
    AddLine: (self: Canvas, Info: CanvasDrawingInfo?) -> Frame,
    AddText: (self: Canvas, Info: CanvasDrawingInfo?) -> TextLabel,
    AddImage: (self: Canvas, Info: CanvasDrawingInfo | string | number) -> ImageLabel,
    AddGradient: (self: Canvas, Target: GuiObject | CanvasGradientInfo?, Info: CanvasGradientInfo?) -> UIGradient,
    Clear: (self: Canvas) -> (),
    SetHeight: (self: Canvas, Height: number) -> (),
    SetVisible: (self: Canvas, Visible: boolean) -> (),
    SetBackgroundTransparency: (self: Canvas, Transparency: number) -> (),
}

export type GraphInfo = CanvasInfo & {
    Values: { number }?,
    Title: string?,
    TitleSize: number?,
    EmptyText: string?,
    Padding: number?,
    GridLines: number?,
    VerticalGridLines: number?,
    Min: number?,
    Max: number?,
    Smooth: boolean?,
    Area: boolean?,
    AreaColor: Color3 | string?,
    AreaTransparency: number?,
    Glow: boolean?,
    GlowColor: Color3 | string?,
    GlowTransparency: number?,
    GlowThickness: number?,
    PointGlowTransparency: number?,
    GridColor: Color3 | string?,
    GridTransparency: number?,
    BaselineTransparency: number?,
    VerticalGridTransparency: number?,
    LineColor: Color3 | string?,
    LineTransparency: number?,
    LineThickness: number?,
    PointColor: Color3 | string?,
    PointTransparency: number?,
    PointSize: number?,
}

export type Graph = {
    Canvas: Canvas,
    Values: { number },
    Type: "Graph",
    SetValues: (self: Graph, Values: { number }) -> (),
    SetVisible: (self: Graph, Visible: boolean) -> (),
    SetHeight: (self: Graph, Height: number) -> (),
}

export type PlayerCardInfo = CanvasInfo & {
    Player: Player | { [string]: any }?,
    Thumbnail: string?,
    Footer: string?,
    HealthText: string?,
    Badge: string?,
    Tag: string?,
    Rank: string?,
    BadgeColor: Color3 | string?,
    BadgeTransparency: number?,
}

export type PlayerCard = {
    Canvas: Canvas,
    Player: Player | { [string]: any },
    Type: "PlayerCard",
    SetPlayer: (self: PlayerCard, Player: Player | { [string]: any }) -> (),
    Refresh: (self: PlayerCard) -> (),
    SetVisible: (self: PlayerCard, Visible: boolean) -> (),
}

export type TopUserBoxInfo = CanvasInfo & {
    Users: { any }?,
    RowHeight: number?,
    MaxUsers: number?,
    Title: string?,
    Subtitle: string?,
    ScoreFallback: number?,
}

export type TopUserBox = {
    Canvas: Canvas,
    Users: { any },
    Type: "TopUserBox",
    SetUsers: (self: TopUserBox, Users: { any }) -> (),
    Refresh: (self: TopUserBox) -> (),
    SetVisible: (self: TopUserBox, Visible: boolean) -> (),
}

export type UIPassthrough = {
    Instance: GuiBase2d,
    Height: number,
    Visible: boolean,
    Type: "UIPassthrough",
    Holder: Frame,

    SetHeight: (self: UIPassthrough, Height: number) -> (),
    SetInstance: (self: UIPassthrough, Instance: GuiBase2d) -> (),
    SetVisible: (self: UIPassthrough, Visible: boolean) -> (),
}

export type Divider = {
    Type: "Divider",
    Holder: Frame,
}

export type Element =
    Label
    | Button
    | Toggle
    | Input
    | Slider
    | Dropdown
    | Viewport
    | Image
    | Video
    | Sprite
    | UIPassthrough
    | Divider
    | Tabbox
    | CustomFontText
    | Canvas
    | Graph
    | PlayerCard
    | TopUserBox
export type Option =
    Toggle
    | Input
    | Slider
    | Dropdown
    | Viewport
    | Image
    | Video
    | Sprite
    | UIPassthrough
    | Canvas
    | Graph
    | PlayerCard
    | TopUserBox
    | KeyPicker
    | KeybindMenuToggle
    | ColorPicker

--// Container Types
export type BaseGroupbox = {
    AddDivider: (self: Groupbox, MarginTop: number?, MarginBottom: number?) -> (),
    AddLabel: (
        self: Groupbox,
        Info: { Text: string, DoesWrap: boolean?, Size: number?, Visible: boolean?, Idx: string? } | string,
        DoesWrap: boolean?,
        Idx: string?
    ) -> Label,
    AddButton: (self: Groupbox, Info: ButtonInfo | string, Func: (() -> ())?, Idx: string?) -> Button,
    AddCustomFontLabel: (
        self: Groupbox,
        Info:
            | {
                Text: string?,
                Font: CustomFont?,
                Size: number?,
                Height: number?,
                TextSize: number?,
                TextColor3: Color3?,
                Color: Color3?,
                TextXAlignment: Enum.TextXAlignment?,
                TextYAlignment: Enum.TextYAlignment?,
                TextWrapped: boolean?,
                DoesWrap: boolean?,
                Visible: boolean?,
            }
            | string,
        Font: CustomFont?,
        Idx: string?
    ) -> CustomFontText,
    AddGlassPanel: ((self: Groupbox, Info: GlassPanelInfo) -> GlassPanel)
        & ((self: Groupbox, Idx: string, Info: GlassPanelInfo) -> GlassPanel),
    AddHighlightButton: (self: Groupbox, Info: NewElementButtonInfo) -> NewElementButton,
    AddShinyButton: (self: Groupbox, Info: NewElementButtonInfo) -> NewElementButton,
    AddLiquidGlassButton: (self: Groupbox, Info: NewElementButtonInfo) -> NewElementButton,
    AddLiquidGlassToggle: (self: Groupbox, Idx: string, Info: ToggleInfo) -> Toggle,
    AddCheckbox: (self: Groupbox, Idx: string, Info: ToggleInfo) -> Toggle,
    AddToggle: (self: Groupbox, Idx: string, Info: ToggleInfo) -> Toggle,
    AddInput: (self: Groupbox, Idx: string, Info: InputInfo) -> Input,
    AddSlider: (self: Groupbox, Idx: string, Info: SliderInfo) -> Slider,
    AddDropdown: (self: Groupbox, Idx: string, Info: DropdownInfo) -> Dropdown,
    AddViewport: (self: Groupbox, Idx: string, Info: ViewportInfo) -> Viewport,
    AddImage: (self: Groupbox, Idx: string, Info: ImageInfo) -> Image,
    AddVideo: (self: Groupbox, Idx: string, Info: VideoInfo) -> Video,
    AddSprite: (self: Groupbox, Idx: string, Info: SpriteInfo) -> Sprite,
    AddUIPassthrough: (self: Groupbox, Idx: string, Info: UIPassthroughInfo) -> UIPassthrough,
    AddCanvas: ((self: Groupbox, Idx: string, Info: CanvasInfo) -> Canvas)
        & ((self: Groupbox, Info: CanvasInfo) -> Canvas),
    AddGraph: ((self: Groupbox, Idx: string, Info: GraphInfo) -> Graph) & ((self: Groupbox, Info: GraphInfo) -> Graph),
    AddPlayerCard: ((self: Groupbox, Idx: string, Info: PlayerCardInfo) -> PlayerCard)
        & ((self: Groupbox, Info: PlayerCardInfo) -> PlayerCard),
    AddTopUserBox: ((self: Groupbox, Idx: string, Info: TopUserBoxInfo) -> TopUserBox)
        & ((self: Groupbox, Info: TopUserBoxInfo) -> TopUserBox),
    AddTabbox: (self: Groupbox, Info: { Name: string?, RainbowBorder: boolean?, Visible: boolean? } | string?) -> Tabbox,
    AddDependencyBox: (self: Groupbox) -> DependencyBox,
    AddDependencyGroupbox: (self: Groupbox) -> DependencyGroupbox,
}

export type DependencyBox = BaseGroupbox & {
    Visible: boolean,
    Dependencies: { [number]: { Element } },
    Holder: Frame,
    Container: Frame,
    Elements: { [number]: Element },
    DependencyBoxes: { [number]: DependencyBox },
    Tabboxes: { [string]: Tabbox },

    Resize: (self: DependencyBox) -> (),
    Update: (self: DependencyBox, CancelSearch: boolean?) -> (),
    SetupDependencies: (self: DependencyBox, Dependencies: { { Element } }) -> (),
}

export type DependencyGroupbox = BaseGroupbox & {
    Visible: boolean,
    Dependencies: { [number]: { Element } },
    BoxHolder: Frame,
    Holder: Frame,
    Container: Frame,
    Tab: Tab,
    Elements: { [number]: Element },
    DependencyBoxes: { [number]: DependencyBox },
    Tabboxes: { [string]: Tabbox },
    Collapsed: boolean,
    SearchExpanded: boolean,

    Resize: (self: DependencyGroupbox) -> (),
    SetCollapsed: (self: DependencyGroupbox, Collapsed: boolean) -> (),
    ToggleCollapsed: (self: DependencyGroupbox) -> (),
    Update: (self: DependencyGroupbox, CancelSearch: boolean?) -> (),
    SetupDependencies: (self: DependencyGroupbox, Dependencies: { { Element } }) -> (),
}

export type Groupbox = BaseGroupbox & {
    BoxHolder: Frame,
    Holder: Frame,
    Container: Frame,
    Tab: Tab,
    DependencyBoxes: { [number]: DependencyBox },
    Tabboxes: { [string]: Tabbox },
    Elements: { [number]: Element },
    Collapsed: boolean,
    SearchExpanded: boolean,

    Resize: (self: Groupbox) -> (),
    SetCollapsed: (self: Groupbox, Collapsed: boolean) -> (),
    ToggleCollapsed: (self: Groupbox) -> (),
}

export type SubTab = BaseGroupbox & {
    ButtonHolder: TextButton,
    Container: Frame,
    Tab: Tab,
    Elements: { [number]: Element },
    DependencyBoxes: { [number]: DependencyBox },
    Tabboxes: { [string]: Tabbox },

    Show: (self: SubTab) -> (),
    Hide: (self: SubTab) -> (),
    Resize: (self: SubTab) -> (),
}

export type Tabbox = {
    ActiveTab: SubTab?,
    BoxHolder: Frame,
    Holder: Frame,
    Tabs: { [string]: SubTab },
    Text: string?,
    Type: "Tabbox"?,
    Visible: boolean?,

    AddTab: (self: Tabbox, Name: string, IconName: string?) -> SubTab,
    Resize: (self: Tabbox) -> (),
    SetVisible: (self: Tabbox, Visible: boolean) -> (),
    UpdateCorners: (self: Tabbox) -> (),
}

export type Tab = {
    Groupboxes: { [string]: Groupbox },
    Tabboxes: { [string]: Tabbox },
    DependencyGroupboxes: { [number]: DependencyGroupbox },
    Sides: { ScrollingFrame },
    WarningBox: { IsNormal: boolean, LockSize: boolean, Visible: boolean, Title: string, Text: string },

    UpdateWarningBox: (
        self: Tab,
        Info: { IsNormal: boolean?, LockSize: boolean?, Visible: boolean?, Title: string?, Text: string? }
    ) -> (),
    Resize: (self: Tab, ResizeWarningBox: boolean?) -> (),
    AddGroupbox: (
        self: Tab,
        Info: { Side: number | string, Name: string, IconName: string?, Collapsed: boolean?, RainbowBorder: boolean? }
    ) -> Groupbox,
    AddLeftGroupbox: (self: Tab, Name: string, IconName: string?) -> Groupbox,
    AddRightGroupbox: (self: Tab, Name: string, IconName: string?) -> Groupbox,
    AddFullGroupbox: (self: Tab, Name: string, IconName: string?) -> Groupbox,
    AddTabbox: (self: Tab, Info: { Side: number | string, Name: string?, RainbowBorder: boolean? }) -> Tabbox,
    AddLeftTabbox: (self: Tab, Name: string?) -> Tabbox,
    AddRightTabbox: (self: Tab, Name: string?) -> Tabbox,
    AddFullTabbox: (self: Tab, Name: string?) -> Tabbox,
    AddCard: (
        self: Tab,
        Info: {
            Side: (number | string)?,
            Title: string?,
            Desc: string?,
            Description: string?,
            Icon: string?,
            Thumbnail: string?,
            Height: number?,
            BarHeight: number?,
            HoverHeight: number?,
            DisableHoverGrow: boolean?,
            LayoutOrder: number?,
            BottomBarTransparency: number?,
            StrokeColor: (Color3 | string)?,
            StrokeThickness: number?,
            StrokeTransparency: number?,
            RainbowBorder: boolean?,
            ThumbnailTransparency: number?,
            TargetTab: Tab | string?,
            Tab: Tab | string?,
            Callback: ((any) -> ())?,
        }
    ) -> {
        Holder: TextButton,
        TargetTab: Tab | string?,
        SetTargetTab: (self: any, NewTargetTab: Tab | string?) -> (),
    },
    addcard: (
        self: Tab,
        Info: {
            Side: (number | string)?,
            Title: string?,
            Desc: string?,
            Description: string?,
            Icon: string?,
            Thumbnail: string?,
            Height: number?,
            BarHeight: number?,
            HoverHeight: number?,
            DisableHoverGrow: boolean?,
            LayoutOrder: number?,
            BottomBarTransparency: number?,
            StrokeColor: (Color3 | string)?,
            StrokeThickness: number?,
            StrokeTransparency: number?,
            RainbowBorder: boolean?,
            ThumbnailTransparency: number?,
            TargetTab: Tab | string?,
            Tab: Tab | string?,
            Callback: ((any) -> ())?,
        }
    ) -> {
        Holder: TextButton,
        TargetTab: Tab | string?,
        SetTargetTab: (self: any, NewTargetTab: Tab | string?) -> (),
    },
    Hover: (self: Tab, Hovering: boolean) -> (),
    Show: (self: Tab) -> (),
    Hide: (self: Tab) -> (),
    SetVisible: (self: Tab, Visible: boolean) -> (),
}

export type KeyBox = {
    ExpectedKey: string?,
    CaseSensitive: boolean,
    AutoClear: boolean,
    ClearOnSuccess: boolean,
    LastKey: string,
    LastSuccess: boolean,
    Type: "KeyBox",

    SetStatus: (self: KeyBox, Text: string, Color: (Color3 | string)?) -> (),
    SetExpectedKey: (self: KeyBox, ExpectedKey: string?) -> (),
    SetValue: (self: KeyBox, Value: string?) -> (),
    GetValue: (self: KeyBox) -> string,
    Submit: (self: KeyBox) -> (),
}

export type KeyBoxInfo = {
    ExpectedKey: string?,
    Default: string?,
    Placeholder: string?,
    ButtonText: string?,
    StatusText: string?,
    SuccessText: string?,
    FailureText: string?,
    StatusColor: Color3 | string?,
    CaseSensitive: boolean?,
    AutoClear: boolean?,
    ClearOnSuccess: boolean?,
    ClearTextOnFocus: boolean?,
    ShowStatus: boolean?,
    Callback: (Success: boolean, Key: string, KeyBox: KeyBox) -> (),
}

export type KeyTab = BaseGroupbox & {
    Elements: { [any]: any },
    IsKeyTab: true,
    Container: ScrollingFrame,

    AddKeyBox: ((self: KeyTab, Callback: (Key: string) -> ()) -> KeyBox) & ((
        self: KeyTab,
        ExpectedKey: string?,
        Callback: (Success: boolean, Key: string, KeyBox: KeyBox) -> ()
    ) -> KeyBox) & ((self: KeyTab, Info: KeyBoxInfo) -> KeyBox),
    Resize: (self: KeyTab) -> (),
    Hover: (self: KeyTab, Hovering: boolean) -> (),
    Show: (self: KeyTab) -> (),
    Hide: (self: KeyTab) -> (),
    SetVisible: (self: KeyTab, Visible: boolean) -> (),
}

export type DialogButtonInfo = {
    Title: string,
    Variant: string?,
    WaitTime: number?,
    Order: number?,
    Callback: ((any) -> ())?,
}

export type DialogInfo = {
    Id: string?,
    Title: string,
    Description: string?,
    Icon: string?,
    TitleColor: Color3?,
    DescriptionColor: Color3?,
    AutoDismiss: boolean?,
    OutsideClickDismiss: boolean?,
    OverlayTransparency: number?,
    RainbowBorder: boolean?,
    FooterButtons: { [string]: DialogButtonInfo }?,
}

export type Dialog = {
    SetTitle: (self: Dialog, Title: string) -> (),
    SetDescription: (self: Dialog, Description: string) -> (),
    AddFooterButton: (self: Dialog, ButtonIdx: string, ButtonInfo: DialogButtonInfo) -> (),
    RemoveFooterButton: (self: Dialog, ButtonIdx: string) -> (),
    SetButtonDisabled: (self: Dialog, ButtonIdx: string, Disabled: boolean) -> (),
    SetButtonOrder: (self: Dialog, ButtonIdx: string, Order: number) -> (),
    Dismiss: (self: Dialog) -> (),
}

export type PopupActionInfo = {
    Title: string?,
    Text: string?,
    Variant: "Primary" | "Secondary" | "Destructive" | "Ghost"?,
    Risky: boolean?,
    Order: number?,
    CloseOnClick: boolean?,
    Callback: ((any) -> ())?,
    Func: ((any) -> ())?,
}

export type PopupInfo = {
    Id: string?,
    Title: string?,
    Description: string?,
    Icon: string | number?,
    Type: "Info" | "Success" | "Warning" | "Error"?,
    Variant: "Info" | "Success" | "Warning" | "Error"?,
    Time: number?,
    Persist: boolean?,
    AutoDismiss: boolean?,
    Dismissible: boolean?,
    CloseButton: boolean?,
    ShowOverlay: boolean?,
    Modal: boolean?,
    OutsideClickDismiss: boolean?,
    OverlayTransparency: number?,
    Width: number?,
    MaxWidth: number?,
    Position: UDim2?,
    AnchorPoint: Vector2?,
    AccentColor: Color3 | string?,
    IconColor: Color3 | string?,
    TitleColor: Color3 | string?,
    DescriptionColor: Color3 | string?,
    RainbowBorder: boolean?,
    Actions: { PopupActionInfo }?,
    Buttons: { PopupActionInfo }?,
}

export type Popup = {
    Id: string,
    Destroyed: boolean,
    SetTitle: (self: Popup, Title: string) -> (),
    SetDescription: (self: Popup, Description: string) -> (),
    SetIcon: (self: Popup, Icon: string | number) -> (),
    Close: (self: Popup) -> (),
    Destroy: (self: Popup) -> (),
    Dismiss: (self: Popup) -> (),
}

export type LoadingErrorButtonInfo = {
    Title: string?,
    Variant: "Primary" | "Secondary" | "Destructive" | "Ghost"?,
    Callback: ((Loading) -> ())?,
}

export type LoadingDrawingGradientInfo = {
    Type: string?,
    Kind: string?,
    Name: string?,
    Color: ColorSequence?,
    ColorSequence: ColorSequence?,
    Offset: Vector2?,
    Rotation: number?,
    Transparency: NumberSequence?,
}

export type LoadingDrawingFrameInfo = {
    Type: string?,
    Kind: string?,
    Name: string?,
    AnchorPoint: Vector2?,
    BackgroundColor3: Color3 | string?,
    Color: Color3 | string?,
    BackgroundTransparency: number?,
    Transparency: number?,
    Position: UDim2?,
    Rotation: number?,
    Size: UDim2?,
    Visible: boolean?,
    ClipsDescendants: boolean?,
    ZIndex: number?,
    CornerRadius: number?,
    Radius: number?,
    Stroke: boolean?,
    StrokeColor: Color3 | string?,
    StrokeThickness: number?,
    StrokeTransparency: number?,
    Gradient: LoadingDrawingGradientInfo?,
    Image: string | number?,
    Texture: string | number?,
    Url: string?,
    URL: string?,
    Frames: { string | number }?,
    Images: { string | number }?,
    FrameRate: number?,
    FPS: number?,
    TextureColor3: Color3 | string?,
    TextureTransparency: number?,
    TextureZIndex: number?,
    TextureCornerRadius: number?,
    ImageColor3: Color3 | string?,
    ImageTransparency: number?,
    ImageRectOffset: Vector2?,
    ImageRectSize: Vector2?,
    RectOffset: Vector2?,
    RectSize: Vector2?,
    ScaleType: Enum.ScaleType?,
    SliceCenter: Rect?,
    TileSize: UDim2?,
}

export type LoadingDrawingImageInfo = LoadingDrawingFrameInfo & {
    Type: string?,
}

export type LoadingDrawingInfo = LoadingDrawingFrameInfo | LoadingDrawingImageInfo | LoadingDrawingGradientInfo

export type LoadingGradientStop = {
    [number]: number?,
    Position: number?,
    Time: number?,
    Point: number?,
    Color: Color3 | string?,
    Color3: Color3?,
}

export type LoadingTransparencyStop = {
    [number]: number?,
    Position: number?,
    Time: number?,
    Point: number?,
    Value: number?,
    Transparency: number?,
    Alpha: number?,
}

export type LoadingInfo = {
    Title: string?,
    Icon: string | number?,
    IconSize: UDim2?,
    LoadingIcon: string | number?,
    LoadingIconColor: Color3 | string?,
    LoadingIconTweenTime: number?,
    ShowLoadingIcon: boolean?,
    CenterIcon: boolean?,
    LoadingIconVisible: boolean?,
    Animated: boolean?,
    EntranceAnimation: boolean?,
    AppearAnimation: boolean?,
    ExitAnimation: boolean?,
    DisappearAnimation: boolean?,
    DisableAnimation: boolean?,
    DisableAppearAnimation: boolean?,
    DisableDisappearAnimation: boolean?,
    EntranceAnimationDuration: number?,
    ExitAnimationDuration: number?,
    AmbientGradient: boolean?,
    Backdrop: boolean?,
    BackdropTransparency: number?,
    IconPulse: boolean?,
    SurfaceTransparency: number?,
    SurfaceFill: boolean?,
    SurfaceFillTransparency: number?,
    SurfaceFillColor: Color3 | string?,
    SurfaceInnerStroke: boolean?,
    SurfaceInnerStrokeColor: Color3 | string?,
    SurfaceInnerStrokeTransparency: number?,
    DrawingDecorations: boolean?,
    Drawings: { LoadingDrawingInfo }?,
    Decor: boolean?,
    DecorImage: string | number?,
    DecorFrames: { string | number }?,
    DecorFrameRate: number?,
    DecorImageTransparency: number?,
    DecorImageColor3: Color3 | string?,
    DecorHeight: number?,
    DecorPosition: "Top" | "Bottom" | "Full" | string?,
    DecorScaleType: Enum.ScaleType?,
    ProgressShine: boolean?,
    ProgressShineColor: Color3 | string?,
    ProgressShineTransparency: number?,
    ProgressShineSpeed: number?,
    ProgressShineWidth: number?,
    ProgressShineRotation: number?,
    ProgressTexture: boolean?,
    ProgressTextureImage: string | number?,
    ProgressTextureFrames: { string | number }?,
    ProgressTextureFrameRate: number?,
    ProgressTextureTransparency: number?,
    ProgressTextureColor: Color3 | string?,
    ProgressTextureSpeed: number?,
    ProgressTextureTileSize: UDim2?,
    ProgressTextureScrollOffset: number?,
    ProgressTrackTexture: boolean?,
    ProgressTrackTextureImage: string | number?,
    ProgressTrackTextureFrames: { string | number }?,
    ProgressTrackTextureFrameRate: number?,
    ProgressTrackTextureTransparency: number?,
    ProgressTrackTextureColor: Color3 | string?,
    ProgressTrackTextureTileSize: UDim2?,
    ProgressTrackTextureScrollOffset: number?,
    GradientTransition: boolean?,
    GradientTransitionDuration: number?,
    GradientTransitionRotation: number?,
    GradientTransitionStops: { LoadingGradientStop }?,
    GradientTransitionTransparency: NumberSequence | { LoadingTransparencyStop } | number?,
    GradientTransitionTransparencyStops: { LoadingTransparencyStop }?,
    GradientTransitionInOffset: Vector2?,
    GradientTransitionOutOffset: Vector2?,
    GradientTransitionExitInOffset: Vector2?,
    GradientTransitionExitOutOffset: Vector2?,
    ProgressBarSize: UDim2?,
    ProgressBarHeight: number?,
    ProgressBarPadding: number?,
    ProgressBarTransparency: number?,
    ProgressBarColor: Color3 | string?,
    ProgressBarStrokeColor: Color3 | string?,
    ProgressBarStrokeTransparency: number?,
    ProgressBarShadowTransparency: number?,
    ProgressFillTransparency: number?,
    ProgressFillColor: Color3 | string?,
    ProgressCap: boolean?,
    ProgressCapColor: Color3 | string?,
    ProgressCapTransparency: number?,
    SmoothProgress: boolean?,
    SmoothProgressDuration: number?,
    SmoothProgressDefaultDuration: number?,
    SmoothProgressMinDuration: number?,
    SmoothProgressMaxDuration: number?,
    SmoothProgressCadenceScale: number?,
    Particles: boolean?,
    ParticleCount: number?,
    CurrentStep: number?,
    TotalSteps: number?,
    ShowSidebar: boolean?,
    AutoResizeHeight: boolean?,
    WindowWidth: number?,
    WindowHeight: number?,
    ContentWidth: number?,
    SidebarWidth: number?,
}

export type Loading = {
    CurrentStep: number,
    TotalSteps: number,
    ShowSidebar: boolean,
    AutoResizeHeight: boolean,
    IsError: boolean,
    Destroyed: boolean,
    WindowWidth: number,
    WindowHeight: number,
    ContentWidth: number,
    SidebarWidth: number,
    ScreenGui: ScreenGui,
    DrawingLayer: Frame,
    Drawings: { GuiObject },
    Sidebar: BaseGroupbox,

    AddDrawingFrame: (self: Loading, Info: LoadingDrawingFrameInfo?) -> Frame,
    AddDrawingImage: (self: Loading, Info: LoadingDrawingImageInfo | string | number) -> ImageLabel,
    AddDrawingLine: (self: Loading, Info: LoadingDrawingFrameInfo?) -> Frame,
    AddDrawingGradient: (
        self: Loading,
        Target: GuiObject | LoadingDrawingGradientInfo?,
        Info: LoadingDrawingGradientInfo?
    ) -> UIGradient,
    ClearDrawings: (self: Loading) -> (),
    UpdateLayout: (self: Loading) -> (),
    SetMessage: (self: Loading, Text: string) -> (),
    SetDescription: (self: Loading, Text: string) -> (),
    SetLoadingIcon: (self: Loading, Icon: string | number) -> (),
    SetLoadingIconTweenTime: (self: Loading, TweenTime: number) -> (),
    SetLoadingIconColor: (self: Loading, Color: Color3 | string) -> (),
    SetProgressTexture: (self: Loading, Image: string | number) -> (),
    SetProgressTextureFrames: (self: Loading, Images: { string | number }, FrameRate: number?) -> (),
    SetProgressTrackTexture: (self: Loading, Image: string | number) -> (),
    SetProgressTrackTextureFrames: (self: Loading, Images: { string | number }, FrameRate: number?) -> (),
    SetProgressTextureTransparency: (self: Loading, Transparency: number) -> (),
    SetProgressTrackTextureTransparency: (self: Loading, Transparency: number) -> (),
    SetDecorImage: (self: Loading, Image: string | number) -> (),
    SetDecorFrames: (self: Loading, Images: { string | number }, FrameRate: number?) -> (),
    SetDecorVisible: (self: Loading, Visible: boolean) -> (),
    SetDecorTransparency: (self: Loading, Transparency: number) -> (),
    SetSurfaceTransparency: (self: Loading, Transparency: number) -> (),
    SetSurfaceFillTransparency: (self: Loading, Transparency: number) -> (),
    SetCurrentStep: (self: Loading, Step: number, Duration: number?) -> (),
    SetTotalSteps: (self: Loading, Steps: number) -> (),
    SetWindowHeight: (self: Loading, Height: number) -> (),
    SetWindowWidth: (self: Loading, Width: number) -> (),
    SetContentWidth: (self: Loading, Width: number) -> (),
    SetSidebarWidth: (self: Loading, Width: number) -> (),
    ShowSidebarPage: (self: Loading, Bool: boolean) -> (),
    ShowErrorPage: (self: Loading, Enabled: boolean) -> (),
    SetErrorMessage: (self: Loading, Text: string) -> (),
    SetErrorButtons: (self: Loading, Buttons: { [string]: LoadingErrorButtonInfo }) -> (),
    Destroy: (self: Loading) -> (),
    Continue: (self: Loading) -> (),
}

export type Window = {
    IsSidebarCompacted: (self: Window) -> boolean,
    GetSidebarWidth: (self: Window) -> number,
    SetSidebarWidth: (self: Window, Width: number) -> (),
    AddTab: (
        self: Window,
        Info:
            | { Name: string, Icon: string?, Description: string?, ShowInTabHolder: boolean?, Hidden: boolean?, Visible: boolean? }
            | string,
        Icon: string?,
        Description: string?
    ) -> Tab,
    AddHiddenTab: (
        self: Window,
        Info: { Name: string, Icon: string?, Description: string? } | string,
        Icon: string?,
        Description: string?
    ) -> Tab,
    AddKeyTab: (
        self: Window,
        Info: { Name: string, Icon: string?, Description: string? } | string,
        Icon: string?,
        Description: string?
    ) -> KeyTab,
    AddDashboardTab: (
        self: Window,
        Info: {
            Name: string?,
            Icon: string?,
            Description: string?,
            Title: string?,
            Text: string?,
            Badge: string?,
            AccentColor: Color3 | string?,
            HubName: string?,
            PrimaryActionText: string?,
            HubTitle: string?,
            HubDescription: string?,
            HubIcon: string?,
            HubBanner: string?,
            HubBannerHeight: number?,
            BannerHeight: number?,
            DiscordInvite: string?,
            Socials: { [string]: string }?,
            Advanced: boolean?,
            Player: Player | { [string]: any }?,
            PlayerFooter: string?,
            GraphTitle: string?,
            GraphValues: { number }?,
            GraphHeight: number?,
            GraphBackgroundTransparency: number?,
            GraphGridLines: number?,
            GraphSmooth: boolean?,
            GraphArea: boolean?,
            GraphAreaTransparency: number?,
            GraphGlow: boolean?,
            GraphGlowTransparency: number?,
            GraphLineThickness: number?,
            GraphPointSize: number?,
            TopUsersTitle: string?,
            TopUsersSubtitle: string?,
            TopUsers: { any }?,
            TopUsersMax: number?,
            DetailTabName: string?,
            DetailTabIcon: string?,
            DetailTabDescription: string?,
            DetailGroupTitle: string?,
            DetailCardTitle: string?,
            DetailCardDescription: string?,
            DetailCardHeight: number?,
            DetailCardBarHeight: number?,
            DetailCardTransparency: number?,
            DetailCardSide: (number | string)?,
            DetailCardLayoutOrder: number?,
        }?
    ) -> Tab,
    AddDialog: (self: Window, InfoOrId: DialogInfo | string, Info: DialogInfo?) -> Dialog,
    ShowDialog: (self: Window, Info: DialogInfo) -> Dialog,
    Dialog: (self: Window, Info: DialogInfo) -> Dialog,
    AddPopup: (self: Window, Info: PopupInfo | string, Time: number?) -> Popup,
    ShowPopup: (self: Window, Info: PopupInfo | string, Time: number?) -> Popup,
    Popup: (self: Window, Info: PopupInfo | string, Time: number?) -> Popup,
    ChangeTitle: (self: Window, Title: string) -> (),
    ChangeBackgroundImage: (self: Window, Image: string) -> (),
    ChangeFooter: (self: Window, Footer: string) -> (),
    SetFooter: (self: Window, Footer: string) -> (),
    SetFooterLeft: (self: Window, Footer: string) -> (),
    SetFooterRight: (self: Window, Footer: string) -> (),
    SetFooterSections: (self: Window, Info: { Left: string?, Center: string?, Right: string? }) -> (),
    SetBackgroundImage: (self: Window, Image: string) -> (),
    SetFullscreenBackgroundImage: (self: Window, Image: string?) -> (),
    SetBackgroundImageTransparency: (self: Window, Transparency: number) -> (),
    SetBackgroundImageSurfaceTransparency: (
        self: Window,
        ContentTransparency: number?,
        PanelTransparency: number?
    ) -> (),
    SetBackgroundImageLayerTransparency: (
        self: Window,
        ContentTransparency: number?,
        PanelTransparency: number?
    ) -> (),
    SetGradient: (
        self: Window,
        Enabled: boolean,
        GradientInfo: {
            Color: ColorSequence?,
            ColorSequence: ColorSequence?,
            Rotation: number?,
            Transparency: NumberSequence?,
        }?
    ) -> (),
    SetBorder: (
        self: Window,
        Info: {
            Color: (Color3 | string)?,
            Thickness: number?,
            Transparency: number?,
            ShadowColor: (Color3 | string)?,
            ShadowThickness: number?,
            ShadowTransparency: number?,
            OuterShadowColor: (Color3 | string)?,
            OuterShadowThickness: number?,
            OuterShadowTransparency: number?,
        }?
    ) -> (),
    SetRainbowBorder: (self: Window, Enabled: boolean, Targets: RainbowBorderTargets?) -> (),
    SetTabsMode: (self: Window, Mode: "Sidebar" | "Topbar") -> (),
}

--// Main Library Type
export type Library = {
    -- Properties
    LocalPlayer: Player,
    DevicePlatform: Enum.Platform?,
    IsMobile: boolean,
    IsDesktop: boolean,
    IsTouchDevice: boolean,
    IsHybridDevice: boolean,
    ViewportDragWithM1: boolean,
    EnableEscapeToClose: boolean,
    IsRobloxFocused: boolean,
    ScreenGui: ScreenGui?,
    SearchText: string,
    Searching: boolean,
    GlobalSearch: boolean,
    LastSearchTab: Tab?,
    ActiveTab: Tab?,
    Tabs: { [string]: Tab | KeyTab },
    DependencyBoxes: { [number]: DependencyBox | DependencyGroupbox },
    KeybindFrame: Frame?,
    KeybindContainer: ScrollingFrame?,
    KeybindMenuWidth: number,
    KeybindMenuHeight: number?,
    KeybindMenuMaxHeight: number?,
    KeybindToggles: { [number]: KeybindToggle },
    Notifications: { [GuiObject]: Notification },
    ToggleKeybind: Enum.KeyCode,
    TweenInfo: TweenInfo,
    NotifyTweenInfo: TweenInfo,
    Toggled: boolean,
    Unloaded: boolean,
    Labels: { [string | number]: Label | CustomFontText },
    Buttons: { [string | number]: Button | SubButton },
    Toggles: { [string | number]: Toggle | KeybindMenuToggle },
    Options: { [string | number]: Option },
    Font: CustomFontManager,
    CustomFont: CustomFont?,
    Window: Window?,
    Windows: { Window },
    NotifySide: "Right" | "Left",
    ShowCustomCursor: boolean,
    ForceCheckbox: boolean,
    ShowToggleFrameInKeybinds: boolean,
    NotifyOnError: boolean,
    CantDragForced: boolean,
    Signals: { [number]: RBXScriptConnection },
    UnloadSignals: { [number]: () -> () },
    MinSize: Vector2,
    DPIScale: number,
    CornerRadius: number,
    MobileHitSize: number,
    RainbowBorderEnabled: boolean,
    RainbowBorderTargets: RainbowBorderTargets,
    RainbowBorderSpeed: number,
    RainbowBorderSaturation: number,
    RainbowBorderValue: number,
    IsLightTheme: boolean,
    Scheme: Scheme,
    Registry: { [GuiObject]: { [string]: string | () -> Color3 } },
    DPIRegistry: { [GuiObject]: { [string]: any } },
    CopiedColor: { Color3 | number }?,
    ImageManager: {
        AddAsset: (AssetName: string, RobloxAssetId: number, URL: string, ForceRedownload: boolean?) -> nil,
        GetAsset: (AssetName: string) -> string?,
        DownloadAsset: (AssetName: string, ForceRedownload: boolean?) -> nil,
    },

    -- Methods
    UpdateKeybindFrame: (self: Library) -> (),
    UpdateDependencyBoxes: (self: Library) -> (),
    UpdateSearch: (self: Library, SearchText: string) -> (),
    AddToRegistry: (self: Library, Instance: GuiObject, Properties: { [string]: string | () -> Color3 }) -> (),
    RemoveFromRegistry: (self: Library, Instance: GuiObject) -> (),
    AddOutline: (
        self: Library,
        Frame: GuiObject,
        Info: {
            Color: (Color3 | string)?,
            Thickness: number?,
            Transparency: number?,
            ShadowColor: (Color3 | string)?,
            ShadowThickness: number?,
            ShadowTransparency: number?,
            OuterShadowColor: (Color3 | string)?,
            OuterShadowThickness: number?,
            OuterShadowTransparency: number?,
            SoftShadow: boolean?,
            Rainbow: boolean?,
            RainbowTarget: RainbowBorderTarget?,
            RainbowSpeed: number?,
            RainbowSaturation: number?,
            RainbowValue: number?,
        }?
    ) -> (UIStroke, UIStroke, { UIStroke }?),
    AddGradient: (
        self: Library,
        Frame: GuiObject,
        Info: {
            Color: ColorSequence?,
            ColorSequence: ColorSequence?,
            Offset: Vector2?,
            Rotation: number?,
            Transparency: NumberSequence?,
        }?
    ) -> UIGradient,
    AnimateIconSprite: (
        self: Library,
        ImageObject: ImageLabel | ImageButton,
        AtlasInfo: {
            Image: string?,
            AtlasImage: string?,
            Fps: number?,
            FPS: number?,
            Loop: boolean?,
            Frames: { { Offset: Vector2?, Size: Vector2?, ImageRectOffset: Vector2?, ImageRectSize: Vector2? } }?,
            FrameSize: Vector2?,
            FrameCount: number?,
            Columns: number?,
            FileName: string?,
            Name: string?,
            Folder: string?,
            ForceRedownload: boolean?,
        }
    ) -> string?,
    StopIconSpriteAnimation: (self: Library, ImageObject: ImageLabel | ImageButton) -> (),
    AddFloatingSprite: (self: Library, Info: FloatingSpriteInfo) -> FloatingSprite,
    ApplyNewElements: (self: Library, Target: any?) -> any,
    ApplyNewElments: (self: Library, Target: any?) -> any,
    ApplyNewElement: (self: Library, Target: any?) -> any,
    applynewelments: (self: Library, Target: any?) -> any,
    applynewelements: (self: Library, Target: any?) -> any,
    UpdateColorsUsingRegistry: (self: Library) -> (),
    SetGradient: (
        self: Library,
        Enabled: boolean,
        GradientInfo: {
            Color: ColorSequence?,
            ColorSequence: ColorSequence?,
            Rotation: number?,
            Transparency: NumberSequence?,
        }?
    ) -> (),
    SetWindowGradient: (
        self: Library,
        Enabled: boolean,
        GradientInfo: {
            Color: ColorSequence?,
            ColorSequence: ColorSequence?,
            Rotation: number?,
            Transparency: NumberSequence?,
        }?
    ) -> (),
    UpdateDPI: (self: Library, Instance: GuiObject, Properties: { [string]: any }) -> (),
    SetDPIScale: (self: Library, DPIScale: number) -> (),
    GiveSignal: (self: Library, Connection: RBXScriptConnection) -> RBXScriptConnection,
    GetIcon: (self: Library, IconName: string) -> Icon?,
    DownloadUrlAsset: (self: Library, Url: string, Info: DownloadAssetInfo?) -> string,
    DownloadImage: (self: Library, Url: string, Info: DownloadAssetInfo | string?) -> string,
    DownloadVideo: (self: Library, Url: string, Info: DownloadAssetInfo | string?) -> string,
    DownloadSprite: (self: Library, Url: string, Info: DownloadAssetInfo | string?) -> string,
    Validate: (self: Library, Table: { [string]: any }, Template: { [string]: any }) -> { [string]: any },
    GetBetterColor: (self: Library, Color: Color3, Add: number) -> Color3,
    GetDarkerColor: (self: Library, Color: Color3) -> Color3,
    GetKeyString: (self: Library, KeyCode: Enum.KeyCode) -> string,
    GetTextBounds: (self: Library, Text: string, Font: Font | CustomFont, Size: number, Width: number?) -> (number, number),
    DownloadFont: (self: Library, Url: string, Options: { [string]: any }?) -> CustomFont,
    RegisterCustomFont: (self: Library, FontInfo: { [string]: any }) -> CustomFont,
    MouseIsOverFrame: (self: Library, Frame: GuiObject, Mouse: Vector2) -> boolean,
    SafeCallback: (self: Library, Func: (...any) -> ...any, ...any) -> ...any,
    MakeDraggable: (
        self: Library,
        UI: GuiObject,
        DragFrame: GuiObject,
        IgnoreToggled: boolean?,
        IsMainWindow: boolean?
    ) -> (),
    MakeResizable: (self: Library, UI: GuiObject, DragFrame: GuiObject, Callback: (() -> ())?) -> (),
    MakeCover: (self: Library, Holder: GuiObject, Place: string) -> Frame,
    MakeLine: (self: Library, Frame: GuiObject, Info: { AnchorPoint: Vector2?, Position: UDim2, Size: UDim2 }) -> Frame,
    MakeOutline: (self: Library, Frame: GuiObject, Corner: number?, ZIndex: number?) -> Frame,
    AddDraggableButton: (self: Library, Text: string, Func: (DraggableButton) -> (), ExcludeScaling: boolean?) -> DraggableButton,
    SetupPlatformButtons: (self: Library, WindowInfo: { [string]: any }, Platform: "Mobile" | "Desktop") -> (DraggableButton, DraggableButton),
    CloseOpenMenus: (self: Library) -> boolean,
    AddDraggableMenu: (self: Library, Name: string, Info: DraggableMenuInfo?) -> (Frame, ScrollingFrame),
    SetKeybindMenuSize: (self: Library, Width: number?, Height: number?) -> (),
    AddKeybindMenuButton: (self: Library, Info: KeybindMenuButtonInfo | string) -> KeybindMenuButton,
    AddKeybindMenuToggle: (
        (self: Library, Idx: string, Info: KeybindMenuToggleInfo) -> KeybindMenuToggle
    ) & ((self: Library, Info: KeybindMenuToggleInfo) -> KeybindMenuToggle),
    SetWatermarkVisibility: (self: Library, Visible: boolean) -> (),
    SetWatermark: (self: Library, Text: string) -> (),
    AddContextMenu: (
        self: Library,
        Holder: GuiObject,
        Size: UDim2 | () -> UDim2,
        Offset: { [number]: number } | () -> { [number]: number },
        List: number?,
        ActiveCallback: ((boolean) -> ())?
    ) -> ContextMenu,
    AddTooltip: (self: Library, InfoStr: string, DisabledInfoStr: string, HoverInstance: GuiObject) -> Tooltip,
    OnUnload: (self: Library, Callback: () -> ()) -> (),
    Unload: (self: Library) -> (),
    SetFont: (self: Library, FontFace: Font | Enum.Font | CustomFont) -> (),
    SetCustomFont: (self: Library, Font: CustomFont) -> CustomFont,
    CreateCustomText: (self: Library, Parent: GuiObject, Info: { [string]: any }) -> CustomFontText,
    SetNotifySide: (self: Library, Side: "Left" | "Right") -> (),
    Notify: (self: Library, Info: NotificationInfo | string, Time: number?, SoundId: string | number?) -> Notification,
    NotifyInfo: (
        self: Library,
        Info: NotificationInfo | string,
        Time: number?,
        SoundId: string | number?
    ) -> Notification,
    NotifySuccess: (
        self: Library,
        Info: NotificationInfo | string,
        Time: number?,
        SoundId: string | number?
    ) -> Notification,
    NotifyWarning: (
        self: Library,
        Info: NotificationInfo | string,
        Time: number?,
        SoundId: string | number?
    ) -> Notification,
    NotifyError: (
        self: Library,
        Info: NotificationInfo | string,
        Time: number?,
        SoundId: string | number?
    ) -> Notification,
    CreateWindow: (
        self: Library,
        WindowInfo: {
            Title: string?,
            Footer: string?,
            FooterLeft: string?,
            FooterRight: string?,
            Position: UDim2?,
            Size: UDim2?,
            Icon: string?,
            IconSize: UDim2?,
            BackgroundImage: string?,
            BackgroundImageTransparency: number?,
            BackgroundImageScaleType: Enum.ScaleType?,
            BackgroundImageContentTransparency: number?,
            BackgroundImagePanelTransparency: number?,
            BackgroundColor: Color3?,
            Gradient: boolean?,
            GradientColorSequence: ColorSequence?,
            GradientTransparency: NumberSequence?,
            GradientRotation: number?,
            RainbowBorder: boolean?,
            RainbowBorderTargets: RainbowBorderTargets?,
            RainbowBorderSpeed: number?,
            RainbowBorderSaturation: number?,
            RainbowBorderValue: number?,
            BorderColor: Color3 | string?,
            BorderThickness: number?,
            BorderTransparency: number?,
            ShadowColor: Color3 | string?,
            ShadowThickness: number?,
            ShadowTransparency: number?,
            OuterShadowColor: Color3 | string?,
            OuterShadowThickness: number?,
            OuterShadowTransparency: number?,
            TabsMode: "Sidebar" | "Topbar"?,
            TabStyle: "Default" | "Card"?,
            TabTitleMode: TabTitleMode?,
            FullscreenBackground: boolean?,
            FullscreenBackgroundColor: Color3?,
            FullscreenBackgroundTransparency: number?,
            FullscreenBackgroundImage: string?,
            FullscreenBackgroundImageTransparency: number?,
            FullscreenBackgroundImageScaleType: Enum.ScaleType?,
            AutoShow: boolean?,
            Center: boolean?,
            Resizable: boolean?,
            DisableSearch: boolean?,
            SearchbarSize: UDim2?,
            GlobalSearch: boolean?,
            CornerRadius: number?,
            NotifySide: "Left" | "Right"?,
            ShowCustomCursor: boolean?,
            Font: Font | Enum.Font | CustomFont?,
            ToggleKeybind: Enum.KeyCode?,
            KeybindMenuWidth: number?,
            KeybindMenuHeight: number?,
            KeybindMenuMaxHeight: number?,
            KeybindMenuSize: UDim2?,
            KeybindMenuPosition: UDim2?,
            MobileButtonsSide: "Left" | "Right"?,
            MobileButtonsMode: "Normal" | "TopbarPlus"?,
            ShowMobileButtons: boolean?,
            ShowDesktopButtons: boolean?,
            DesktopButtonsSide: "Left" | "Right"?,
            EnableEscapeToClose: boolean?,
            ViewportDragWithM1: boolean?,
            UnlockMouseWhileOpen: boolean?,
            MobileHitSize: number?,
            EnableSidebarResize: boolean?,
            EnableCompacting: boolean?,
            DisableCompactingSnap: boolean?,
            SidebarCompacted: boolean?,
            MinContainerWidth: number?,
            MinSidebarWidth: number?,
            SidebarCompactWidth: number?,
            CompactWidthActivation: number?,
        }
    ) -> Window,
    CreatePopup: (self: Library, Info: PopupInfo | string, Time: number?) -> Popup,
    AddPopup: (self: Library, Info: PopupInfo | string, Time: number?) -> Popup,
    ShowPopup: (self: Library, Info: PopupInfo | string, Time: number?) -> Popup,
    Popup: (self: Library, Info: PopupInfo | string, Time: number?) -> Popup,
    ShowDialog: (self: Library, Info: DialogInfo | PopupInfo) -> Dialog | Popup,
    CreateDialog: (self: Library, Info: DialogInfo | PopupInfo) -> Dialog | Popup,
    Dialog: (self: Library, Info: DialogInfo | PopupInfo) -> Dialog | Popup,
    CreateLoading: (self: Library, LoadingInfo: LoadingInfo?) -> Loading,
    Toggle: (self: Library, Value: boolean?) -> (),
}

return nil
