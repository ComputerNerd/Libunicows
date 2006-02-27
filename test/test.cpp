#include <stdio.h>        // for sprintf() in Ascii version
#include <tchar.h>
#include <windows.h>


LRESULT CALLBACK JanFun(HWND hwnd, unsigned msg, WPARAM wParam, LPARAM lParam)
{	switch(msg)
	{
    case WM_CLOSE: DestroyWindow(hwnd);  break;
    case WM_DESTROY: PostQuitMessage(0); break;
    case WM_KEYDOWN: if(wParam==VK_ESCAPE) DestroyWindow(hwnd); break;

    case WM_PAINT:
    {
      _TCHAR msg1[40] = _T("Program version: ");
      _TCHAR msg2[40] = _T("Character 'A' in memory = ");

      DWORD teste = 0xFFFFFFFF;
      _tcscpy((_TCHAR*)&teste, _T("A"));

      PBYTE pteste = (PBYTE)&teste;
      if(pteste[3]==0xFF) _tcscat(msg1,_T("Ascii")); else _tcscat(msg1,_T("Unicode"));

      _TCHAR letra[10];
      _stprintf(letra,_T("%02X%02X%02X%02X"),pteste[0],pteste[1],pteste[2],pteste[3]);
      _tcscat(msg2,letra);

      PAINTSTRUCT ps;
      RECT rc;
      GetClientRect(hwnd,&rc);
      BeginPaint(hwnd,&ps);
      SetBkMode(ps.hdc,TRANSPARENT);
      SIZE sz;

      GetTextExtentPoint32(ps.hdc,msg1,lstrlen(msg1),&sz);
      TextOut(ps.hdc,(rc.right-sz.cx)/2,(rc.bottom-sz.cy)/2-20,msg1,lstrlen(msg1));

      GetTextExtentPoint32(ps.hdc,msg2,lstrlen(msg2),&sz);
      TextOut(ps.hdc,(rc.right-sz.cx)/2,(rc.bottom-sz.cy)/2+20,msg2,lstrlen(msg2));

      EndPaint(hwnd,&ps);
    }
    break;
	  default: return DefWindowProc(hwnd,msg,wParam,lParam);
	}
	return 0L;
}


int PASCAL WinMain(HINSTANCE hinst,HINSTANCE hp,LPSTR cl,int ns)
{
  MSG msg;
  _TCHAR nome[] = _T("Unicows Test");

  WNDCLASS wcl = {CS_HREDRAW|CS_VREDRAW,JanFun,0,0,hinst,LoadIcon(NULL,IDI_WINLOGO),
									LoadCursor(NULL,IDC_ARROW),CreateSolidBrush(0xB7B480),NULL,nome};
	if(!RegisterClass(&wcl))
  { MessageBox(0, _T("RegisterClass() fail"), _T("Error"),MB_ICONERROR);
    return 0L;
  }

	HWND hwnd=CreateWindow(nome,nome,WS_OVERLAPPEDWINDOW,100,100,600,370,0,0,hinst,0);
	if(!hwnd)
  { MessageBox(0, _T("CreateWindow() fail"), _T("Error"),MB_ICONERROR);
    return 0L;
  }
	ShowWindow(hwnd,ns);
	UpdateWindow(hwnd);

	while(GetMessage(&msg,0,0,0)) {TranslateMessage(&msg); DispatchMessage(&msg);}
	return (msg.wParam);
}
