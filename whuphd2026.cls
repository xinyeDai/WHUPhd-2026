% SPDX-License-Identifier: MIT
% Community doctoral thesis template. Compile with XeLaTeX.
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{whuphd2026}[2026/11/03 v1.0.0 Community doctoral thesis template]
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{whuphd2026}{XeLaTeX is required}{Select XeLaTeX or run latexmk -xelatex.}
\fi
\newif\ifthesisreview
\newif\ifthesisprint
\newif\ifthesisportable
\DeclareOption{review}{\thesisreviewtrue}
\DeclareOption{print}{\thesisprinttrue}
\DeclareOption{portable}{\thesisportabletrue}
\DeclareOption*{\ClassError{whuphd2026}{Unknown option: \CurrentOption}{Use review, print, or portable.}}
\ProcessOptions\relax
\ifthesisprint
  \LoadClass[UTF8,a4paper,zihao=-4,twoside,openright,fontset=none]{ctexbook}
\else
  \LoadClass[UTF8,a4paper,zihao=-4,twoside,openany,fontset=none]{ctexbook}
  \let\cleardoublepage\clearpage
\fi
\RequirePackage{geometry,fancyhdr,etoolbox}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx,array,booktabs,longtable,tabularx}
\RequirePackage{caption,subcaption,enumitem}
\RequirePackage[authoryear,round]{natbib}
\RequirePackage{hyperref}
\geometry{a4paper,top=2.54cm,bottom=2.54cm,left=3.17cm,right=3.17cm,
  headheight=15pt,headsep=23pt,footskip=36pt}
% Prefer the familiar Windows fonts when available; keep Linux/Overleaf usable.
\ifthesisportable
  \setmainfont{TeX Gyre Termes}
\else
  \IfFontExistsTF{Times New Roman}{\setmainfont{Times New Roman}}{\setmainfont{TeX Gyre Termes}}
\fi
\newcommand{\thesisfandolfonts}{%
  \setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf,ItalicFont=FandolKai-Regular.otf]
  \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKmonofont{FandolFang-Regular.otf}
  \setCJKfamilyfont{zhsong}{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKfamilyfont{zhhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKfamilyfont{zhkai}{FandolKai-Regular.otf}[AutoFakeBold=2.5]
  \setCJKfamilyfont{zhfs}{FandolFang-Regular.otf}}
\ifthesisportable
  \thesisfandolfonts
\else
  \IfFontExistsTF{SimSun}{%
    \IfFontExistsTF{SimHei}{%
      \IfFontExistsTF{KaiTi}{%
        \IfFontExistsTF{FangSong}{%
          \setCJKmainfont{SimSun}[AutoFakeBold=2.5,ItalicFont=KaiTi]
          \setCJKsansfont{SimHei}[AutoFakeBold=2.5]
          \setCJKmonofont{FangSong}
          \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold=2.5]
          \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold=2.5]
          \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold=2.5]
          \setCJKfamilyfont{zhfs}{FangSong}
        }{\thesisfandolfonts}
      }{\thesisfandolfonts}
    }{\thesisfandolfonts}
  }{\thesisfandolfonts}
\fi
\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{\CJKfamily{zhfs}}
\newcommand{\thesisuniversity}{武汉大学}
\newcommand{\thesisuniversityen}{Wuhan University}
\newcommand{\thesisname}{博士学位论文}
\newcommand{\thesistitle}{博士学位论文题目}
\newcommand{\thesistitleen}{Title of the Doctoral Dissertation}
\newcommand{\thesisauthor}{作者姓名}
\newcommand{\thesisauthoren}{Author Name}
\newcommand{\thesissupervisor}{导师姓名\quad 教授}
\newcommand{\thesissupervisoren}{Professor Name}
\newcommand{\thesismajor}{学科专业名称}
\newcommand{\thesisdirection}{研究方向}
\newcommand{\thesisschoolen}{School or Research Center}
\newcommand{\thesisdate}{二〇二六年十一月}
\newcommand{\thesisdateen}{November, 2026}
\newcommand{\thesisclassification}{}
\newcommand{\thesisudc}{}
\newcommand{\thesisconfidentiality}{}
\newcommand{\thesiscode}{10486}
\newcommand{\thesiswordmark}{}
\newcommand{\thesisidentity}[1]{\ifthesisreview 匿名\else #1\fi}
\newcommand{\thesisidentityen}[1]{\ifthesisreview Anonymous\else #1\fi}
\hypersetup{unicode,hidelinks,hypertexnames=false,bookmarksnumbered=true}
\AtBeginDocument{%
  \hypersetup{pdftitle={\thesistitle},pdfsubject={Doctoral dissertation}}
  \ifthesisreview\hypersetup{pdfauthor={}}\else\hypersetup{pdfauthor={\thesisauthor}}\fi}
\newcommand{\thesisbodyfont}{\songti\zihao{-4}\renewcommand{\baselinestretch}{1}\selectfont\setlength{\baselineskip}{20pt}}
\ctexset{
  chapter={name={第,章},number=\chinese{chapter},nameformat={},titleformat={},
    format={\centering\heiti\bfseries\zihao{2}},beforeskip=12pt,afterskip=12pt},
  section={format={\raggedright\heiti\bfseries\zihao{3}},beforeskip=12pt,afterskip=12pt},
  subsection={format={\raggedright\songti\bfseries\zihao{-3}},beforeskip=12pt,afterskip=12pt},
  subsubsection={format={\raggedright\songti\bfseries\zihao{-4}},beforeskip=12pt,afterskip=12pt}}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\listfigurename}{图索引}
\renewcommand{\listtablename}{表索引}
\renewcommand{\@pnumwidth}{2.6em}
\renewcommand{\@tocrmarg}{4em}
\renewcommand*{\l@chapter}[2]{%
  \ifnum\c@tocdepth>\m@ne
    \addpenalty{-\@highpenalty}\vskip 1em plus 1pt
    \@dottedtocline{0}{0em}{4.8em}{#1}{#2}%
  \fi}
\newcommand{\thesispagestyle}{%
  \fancyhf{}
  \fancyhead[CE]{\songti\zihao{-5}\thesisuniversity\thesisname}
  \fancyhead[CO]{\songti\zihao{-5}\thesistitle}
  \fancyfoot[C]{\normalfont\zihao{-5}\thepage}
  \renewcommand{\headrulewidth}{0.5pt}}
\fancypagestyle{plain}{\thesispagestyle}
\pagestyle{fancy}\thesispagestyle
\raggedbottom
\clubpenalty=10000
\widowpenalty=10000
% Bounded glue avoids the stretched formula gaps caused by flush-bottom pages.
\newcommand{\thesismathspacing}{%
  \setlength{\abovedisplayskip}{8pt plus 2pt minus 2pt}
  \setlength{\belowdisplayskip}{8pt plus 2pt minus 2pt}
  \setlength{\abovedisplayshortskip}{4pt plus 2pt minus 1pt}
  \setlength{\belowdisplayshortskip}{6pt plus 2pt minus 2pt}}
\appto\normalsize{\thesismathspacing}
\AtBeginDocument{\thesismathspacing}
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}
\setlength{\textfloatsep}{12pt plus 3pt minus 3pt}
\setlength{\intextsep}{10pt plus 3pt minus 3pt}
\setlist{nosep,topsep=4pt,leftmargin=2em}
\numberwithin{equation}{chapter}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\DeclareCaptionFont{thesiscaption}{\kaishu\bfseries\zihao{5}}
\captionsetup{font=thesiscaption,labelsep=space,skip=6pt}
\captionsetup[subfigure]{font=thesiscaption,labelformat=parens,labelsep=space,skip=4pt}
\AtBeginEnvironment{table}{\songti\zihao{5}\renewcommand{\baselinestretch}{1}\selectfont}
\newcommand{\tablenote}[1]{\par\smallskip{\kaishu\zihao{5}\noindent #1\par}}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{definition}[theorem]{定义}
\newtheorem{lemma}[theorem]{引理}
\renewcommand{\proofname}{证明}
\newcommand{\thesisfrontheading}[1]{%
  \begingroup
  \ctexset{chapter={format={\centering\heiti\bfseries\zihao{-2}},beforeskip=6pt,afterskip=6pt}}
  \chapter*{#1}\endgroup}
\newcommand{\thesisfrontchapter}[1]{%
  \thesisfrontheading{#1}\phantomsection\addcontentsline{toc}{chapter}{#1}}
\newenvironment{cnabstract}{%
  \clearpage\thesisfrontchapter{摘要}\begingroup
  \songti\zihao{-4}\renewcommand{\baselinestretch}{1.5}\selectfont
}{\par\endgroup}
\newenvironment{enabstract}{%
  \clearpage\thesisfrontchapter{ABSTRACT}\begingroup
  \normalfont\zihao{-4}\renewcommand{\baselinestretch}{1.5}\selectfont
}{\par\endgroup}
\newcommand{\cnkeywords}[1]{\par\medskip\noindent{\heiti 关键词：}#1\par}
\newcommand{\enkeywords}[1]{\par\medskip\noindent\textbf{Key words: }#1\par}
\newcommand{\thesistoc}{%
  \clearpage\pdfbookmark[0]{目录}{thesis-toc}
  \begingroup
  \ctexset{chapter={format={\centering\heiti\bfseries\zihao{-2}},beforeskip=6pt,afterskip=6pt}}
  \renewcommand{\baselinestretch}{1.5}\normalsize
  \tableofcontents
  \clearpage\phantomsection\addcontentsline{toc}{chapter}{图索引}\listoffigures
  \clearpage\phantomsection\addcontentsline{toc}{chapter}{表索引}\listoftables
  \endgroup}
\renewcommand{\bibfont}{\songti\zihao{5}\renewcommand{\baselinestretch}{1.5}\selectfont}
\setlength{\bibhang}{2em}\setlength{\bibsep}{0pt}
\renewcommand{\bibsection}{\thesisfrontchapter{参考文献}}
% The cover is parameterized; no external logo or personal image is distributed.
\newcommand{\thesiscover}{%
  \clearpage\thispagestyle{empty}
  \pdfbookmark[0]{封面}{thesis-cover}
  \begingroup\setlength{\parindent}{0pt}\renewcommand{\baselinestretch}{1}\selectfont
  {\fangsong\zihao{4}\renewcommand{\arraystretch}{1.4}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lp{22mm}lp{22mm}@{}}
    分\quad 类\quad 号 & \centering\thesisclassification & 密\quad 级 & \centering\arraybackslash\thesisconfidentiality\\\cline{2-2}\cline{4-4}
    U\quad D\quad C & \centering\thesisudc & 编\quad 号 & \centering\arraybackslash\thesiscode\\\cline{2-2}\cline{4-4}
  \end{tabular*}\par}
  \vspace{25mm}
  \begin{center}
    \ifdefempty{\thesiswordmark}{%
      {\kaishu\zihao{0}\thesisuniversity\par}
    }{%
      \includegraphics[width=48mm]{\thesiswordmark}\par
    }
    \vspace{12mm}
    {\songti\bfseries\zihao{2}博\quad 士\quad 学\quad 位\quad 论\quad 文\par}
    \vspace{25mm}
    {\kaishu\zihao{1}\thesistitle\par}
  \end{center}
  \vfill
  {\songti\zihao{4}\renewcommand{\arraystretch}{1.65}
  \begin{tabularx}{\textwidth}{@{}p{52mm}@{：\ }X@{}}
    研\quad 究\quad 生\quad 姓\quad 名 & \thesisidentity{\thesisauthor}\\
    指导教师姓名、职称 & \thesisidentity{\thesissupervisor}\\
    学科、专业名称 & \thesismajor\\
    研\quad 究\quad 方\quad 向 & \thesisdirection
  \end{tabularx}\par}
  \vspace{22mm}
  {\centering\heiti\zihao{3}\thesisdate\par}
  \endgroup\clearpage}
\newcommand{\thesisenglishcover}{%
  \clearpage\thispagestyle{empty}\begingroup\centering
  \renewcommand{\baselinestretch}{1.25}\selectfont
  {\fontsize{22}{28}\selectfont Ph.D. Dissertation of \thesisuniversityen\par}
  \vspace{30mm}
  {\fontsize{22}{30}\selectfont\thesistitleen\par}
  \vfill
  {\zihao{4}By\par\thesisidentityen{\thesisauthoren}\par}
  \vspace{20mm}
  {\zihao{4}\textit{Supervised by}\par\thesisidentityen{\thesissupervisoren}\par}
  \vfill
  {\zihao{4}\thesisschoolen, \thesisuniversityen\par\thesisdateen\par}
  \endgroup\clearpage}
\endinput
