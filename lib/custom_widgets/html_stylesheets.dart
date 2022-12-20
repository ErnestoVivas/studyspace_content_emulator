/*
 * The HTML stylesheets are added to the 'head' section of html data. The first
 * use case of these stylesheets was to properly style the appearance of the
 * overview pages, further use cases might arise in the future
 */

class StudyspaceStylesheets {
  static String mathStylesheet = r"""
    h1 {
      padding-top: 16px;
      padding-bottom: 4px;
      line-height: 1.4;
      color: rgb(24,100,171);
      font-family: Quicksand-Bold;
      font-size: 24px;
    }
    h2 {
      padding-top: 16px;
      padding-bottom: 4px;
      line-height: 1.4;
      color: black;
      font-family: Quicksand-Bold;
      font-size: 22px;
    }
    h3 {
      padding-top: 16px;
      padding-bottom: 2px;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 20px;
    }
    h4 {
      padding-top: 12px;
      padding-bottom: 2px;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 18px;
    }
    h5 {
      padding-top: 8;
      padding-bottom: 2;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 17px;
    }
    h6 {
      padding-top: 8;
      padding-bottom: 2;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-Medium;
      font-size: 17px;
    }
    svg {
      padding-top: 16;
      padding-bottom: 16;
      display: block;
      margin: auto;
    }
    .box {
      margin-top: 16px;
      margin-bottom: 16px;
      padding-top: 12px;
      padding-bottom: 12px;
      padding-left: 16px;
      padding-right: 12px;
      border-radius: 10px;
      border-left: 6px solid rgb(24,100,171);
      background-color: rgb(208,235,255);
      line-height: 1.8;
      color: rgb(24,100,171);
      font-family: Quicksand;
      font-size: 16px;
    }
    hr {
      border: 1.5px solid lightgrey;
      border-radius: 0.75px;
      background-color: lightgrey;
    }
    table {
      padding-top: 12;
      padding-bottom: 12;
      line-height: 1.6;
      border-collapse: seperate;
      border-spacing: 0;
      margin-left: auto;
      margin-right: auto;
    }
    th:first-of-type {
      border-top-left-radius: 10px;
    }
    th:last-of-type {
      border-top-right-radius: 10px;
    }
    tr:last-of-type td:first-of-type {
      border-bottom-left-radius: 10px;
    }
    tr:last-of-type td:last-of-type {
      border-bottom-right-radius: 10px;
    }
    th {
      padding: 4px;
      font-family: Quicksand-Bold;
      color: rgb(24,100,171);
      background-color: rgba(208,235,255, 1.0);
      border: 1px solid rgb(165, 216, 255);
      border-right:none;
    }
    th:last-child {
      border-right: 1px solid rgb(165, 216, 255);
    }
    td {
      padding: 4px;
      font-family: Quicksand;
      background-color: white;
      border: 1px solid rgb(165, 216, 255);
      border-right:none;
      border-top: none;
    }
    td:last-child {
      border-right: 1px solid rgb(165, 216, 255);
    }
    ul {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      list-style-type: disc;
    }
    ol {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      list-style-type: decimal;
    }
    li {
      display: list-item;
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      margin-left: 1em;
      margin-top: 4px;
      margin-bottom: 4px;
    }
    p {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
    }
  """;

  static String germanStylesheet = r"""
    h1 {
      padding-top: 16px;
      padding-bottom: 4px;
      line-height: 1.4;
      color: rgb(166, 30, 77);
      font-family: Quicksand-Bold;
      font-size: 24px;
    }
    h2 {
      padding-top: 16px;
      padding-bottom: 4px;
      line-height: 1.4;
      color: black;
      font-family: Quicksand-Bold;
      font-size: 22px;
    }
    h3 {
      padding-top: 16px;
      padding-bottom: 2px;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 20px;
    }
    h4 {
      padding-top: 12px;
      padding-bottom: 2px;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 18px;
    }
    h5 {
      padding-top: 8;
      padding-bottom: 2;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-SemiBold;
      font-size: 17px;
    }
    h6 {
      padding-top: 8;
      padding-bottom: 2;
      line-height: 1.2;
      color: black;
      font-family: Quicksand-Medium;
      font-size: 17px;
    }
    svg {
      padding-top: 16;
      padding-bottom: 16;
      display: block;
      margin: auto;
    }
    hr {
      border: 1.5px solid lightgrey;
      border-radius: 0.75px;
      background-color: lightgrey;
    }
    table {
      padding-top: 16;
      padding-bottom: 12;
      line-height: 1.6;
      border-collapse: seperate;
      border-spacing: 0;
      margin-left: auto;
      margin-right: auto;
    }
    th:first-of-type {
      border-top-left-radius: 10px;
    }
    th:last-of-type {
      border-top-right-radius: 10px;
    }
    tr:last-of-type td:first-of-type {
      border-bottom-left-radius: 10px;
    }
    tr:last-of-type td:last-of-type {
      border-bottom-right-radius: 10px;
    }
    th {
      padding: 4px;
      font-family: Quicksand-Bold;
      color: rgb(24,100,171);
      background-color: rgba(255,222,235,1.0);
      border: 1px solid rgb(252,194,215);
      border-right:none;
    }
    th:last-child {
      border-right: 1px solid lightgrey;
    }
    td {
      padding: 4px;
      font-family: Quicksand-Bold;
      background-color: white;
      border: 1px solid rgb(252,194,215);
      border-right:none;
      border-top: none;
    }
    td:last-child {
      border-right: 1px solid rgb(252,194,215);
    }
    .box {
      margin-top: 16px;
      margin-bottom: 16px;
      padding-top: 12px;
      padding-bottom: 12px;
      padding-left: 16px;
      padding-right: 12px;
      border-radius: 10px;
      border-left: 6px solid rgb(166, 30, 77);
      background-color: rgb(255,222,235);
      line-height: 1.8;
      color: rgb(166, 30, 77);
      font-family: Quicksand;
      font-size: 16px;
    }
    ul {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      list-style-type: disc;
    }
    ol {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      list-style-type: decimal;
    }
    li {
      display: list-item;
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
      margin-left: 1em;
      margin-top: 4px;
      margin-bottom: 4px;
    }
    p {
      line-height: 1.8;
      color: black;
      font-family: Quicksand;
      font-size: 16px;
    }
  """;

  static Map<int, String> subjectStylesheet = {
    0: mathStylesheet,
    1: germanStylesheet
  };

}