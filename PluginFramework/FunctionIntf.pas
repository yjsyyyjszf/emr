unit FunctionIntf;

interface

uses
  FunctionConst;

const
  FUN_CUSTOM = '{146E64A2-6C78-497B-B6A3-9DFBC8CE7B91}';
  FUN_PLUGIN = '{14085FF8-D940-41B6-869D-49101CFA4BF1}';

type
  IPluginObject = interface
    ['{D8BC0CB7-3491-4C32-B30D-7165BFA34933}']
  end;

  ICustomFunction = interface(IInterface)  // ����ṩ�Ĺ�����Ϣ����
    [FUN_CUSTOM]
    /// <summary>
    /// ���ع��ܵ�ID,��Ψһ��ʶ
    /// </summary>
    /// <returns>ID</returns>
    function GetID: ShortString;

    /// <summary>
    /// ���ù��ܵ�GUID
    /// </summary>
    /// <param name="Value">GUID</param>
    procedure SetID(const Value: ShortString);

    property ID: ShortString read GetID write SetID;
  end;

  IPluginFunction = interface(ICustomFunction)
    [FUN_PLUGIN]
    /// <summary>
    /// �ڽ�����ʾ���ܵ������
    /// </summary>
    function GetShowEntrance: Boolean;

    /// <summary>
    /// �����Ƿ��ڽ�����ʾ���ܵ������
    /// </summary>
    /// <param name="ASingleton">True:��ʾ,False:����ʾ</param>
    procedure SetShowEntrance(const Value: Boolean);

    function GetName: ShortString;
    procedure SetName(const Value: ShortString);

    property Name: ShortString read GetName write SetName;
    property ShowEntrance: Boolean read GetShowEntrance write SetShowEntrance;
  end;

  /// <summary>
  /// ���������������ָ�������¼�
  /// </summary>
  /// <param name="APluginID">�����ܵĲ��ID</param>
  /// <param name="AFunctionID">����Ĺ���ID</param>
  /// <param name="AData">�ù�����Ҫ�������ݵ�ָ��</param>
  TFunctionNotifyEvent = procedure(const APluginID, AFunctionID: ShortString; const APluginObject: IPluginObject);

  /// <summary> ҵ���幦�� </summary>
  IFunBLLFormShow = interface(IPluginFunction)
    [FUN_BLLFORMSHOW]
    /// <summary> ��ȡ������Application�ľ�� </summary>
    /// <returns>���</returns>
    function GetAppHandle: THandle;

    /// <summary> ������������ </summary>
    /// <param name="Value">���</param>
    procedure SetAppHandle(const Value: THandle);

    /// <summary> ���ز������������򹩲�����������ܵķ��� </summary>
    /// <returns>����</returns>
    function GetOnNotifyEvent: TFunctionNotifyEvent;

    /// <summary> ������������򹩲�����������ܵķ��� </summary>
    /// <param name="Value"></param>
    procedure SetOnNotifyEvent(const Value: TFunctionNotifyEvent);

    /// <summary> �������� </summary>
    property AppHandle: THandle read GetAppHandle write SetAppHandle;

    /// <summary> �������������¼� </summary>
    property OnNotifyEvent: TFunctionNotifyEvent read GetOnNotifyEvent write SetOnNotifyEvent;
  end;

implementation

end.