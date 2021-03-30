defmodule FreelaReportsTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds a report with the given file" do
      file_name = "gen_report.csv"

      expected_response = %{
        all_hours: %{
          "Cleiton" => 13797,
          "Daniele" => 13264,
          "Danilo" => 13583,
          "Diego" => 13015,
          "Giuliano" => 13671,
          "Jakeliny" => 13909,
          "Joseph" => 13174,
          "Mayk" => 13526,
          "Rafael" => 13597,
          "Vinicius" => 13412
        },
        hours_per_month: %{
          "Cleiton" => %{
            "abril" => 1161,
            "agosto" => 1149,
            "dezembro" => 1100,
            "fevereiro" => 1168,
            "janeiro" => 1271,
            "julho" => 1236,
            "junho" => 1123,
            "maio" => 998,
            "março" => 1091,
            "novembro" => 1266,
            "outubro" => 1073,
            "setembro" => 1161
          },
          "Daniele" => %{
            "abril" => 1138,
            "agosto" => 1018,
            "dezembro" => 1019,
            "fevereiro" => 1003,
            "janeiro" => 1130,
            "julho" => 1135,
            "junho" => 1092,
            "maio" => 1170,
            "março" => 1177,
            "novembro" => 1131,
            "outubro" => 1046,
            "setembro" => 1205
          },
          "Danilo" => %{
            "abril" => 1232,
            "agosto" => 1200,
            "dezembro" => 1149,
            "fevereiro" => 1156,
            "janeiro" => 1121,
            "julho" => 1114,
            "junho" => 966,
            "maio" => 1075,
            "março" => 1096,
            "novembro" => 1122,
            "outubro" => 1237,
            "setembro" => 1115
          },
          "Diego" => %{
            "abril" => 1112,
            "agosto" => 1129,
            "dezembro" => 1177,
            "fevereiro" => 1144,
            "janeiro" => 1118,
            "julho" => 1099,
            "junho" => 1073,
            "maio" => 1082,
            "março" => 1029,
            "novembro" => 995,
            "outubro" => 928,
            "setembro" => 1129
          },
          "Giuliano" => %{
            "abril" => 1152,
            "agosto" => 1126,
            "dezembro" => 1100,
            "fevereiro" => 1173,
            "janeiro" => 1107,
            "julho" => 1169,
            "junho" => 1197,
            "maio" => 1182,
            "março" => 1097,
            "novembro" => 1105,
            "outubro" => 1123,
            "setembro" => 1140
          },
          "Jakeliny" => %{
            "abril" => 1172,
            "agosto" => 1098,
            "dezembro" => 1122,
            "fevereiro" => 1119,
            "janeiro" => 1118,
            "julho" => 1245,
            "junho" => 1182,
            "maio" => 1129,
            "março" => 1178,
            "novembro" => 1085,
            "outubro" => 1197,
            "setembro" => 1264
          },
          "Joseph" => %{
            "abril" => 1047,
            "agosto" => 1167,
            "dezembro" => 1122,
            "fevereiro" => 1202,
            "janeiro" => 1084,
            "julho" => 1153,
            "junho" => 1105,
            "maio" => 1082,
            "março" => 1038,
            "novembro" => 1005,
            "outubro" => 1058,
            "setembro" => 1111
          },
          "Mayk" => %{
            "abril" => 1016,
            "agosto" => 1079,
            "dezembro" => 1159,
            "fevereiro" => 1085,
            "janeiro" => 1100,
            "julho" => 1093,
            "junho" => 1190,
            "maio" => 1173,
            "março" => 1166,
            "novembro" => 1257,
            "outubro" => 1094,
            "setembro" => 1114
          },
          "Rafael" => %{
            "abril" => 1171,
            "agosto" => 1199,
            "dezembro" => 965,
            "fevereiro" => 1042,
            "janeiro" => 1125,
            "julho" => 1097,
            "junho" => 1218,
            "maio" => 1141,
            "março" => 1220,
            "novembro" => 1163,
            "outubro" => 1161,
            "setembro" => 1095
          },
          "Vinicius" => %{
            "abril" => 1149,
            "agosto" => 1055,
            "dezembro" => 1186,
            "fevereiro" => 1102,
            "janeiro" => 1036,
            "julho" => 979,
            "junho" => 1213,
            "maio" => 1109,
            "março" => 1191,
            "novembro" => 1169,
            "outubro" => 1113,
            "setembro" => 1110
          }
        },
        hours_per_year: %{
          "Cleiton" => %{
            "2016" => 2699,
            "2017" => 2684,
            "2018" => 2805,
            "2019" => 2714,
            "2020" => 2895
          },
          "Daniele" => %{
            "2016" => 2573,
            "2017" => 2862,
            "2018" => 2633,
            "2019" => 2562,
            "2020" => 2634
          },
          "Danilo" => %{
            "2016" => 2746,
            "2017" => 2534,
            "2018" => 2972,
            "2019" => 2666,
            "2020" => 2665
          },
          "Diego" => %{
            "2016" => 2577,
            "2017" => 2647,
            "2018" => 2792,
            "2019" => 2486,
            "2020" => 2513
          },
          "Giuliano" => %{
            "2016" => 2784,
            "2017" => 2696,
            "2018" => 2693,
            "2019" => 2850,
            "2020" => 2648
          },
          "Jakeliny" => %{
            "2016" => 2869,
            "2017" => 2625,
            "2018" => 2765,
            "2019" => 2709,
            "2020" => 2941
          },
          "Joseph" => %{
            "2016" => 2603,
            "2017" => 2617,
            "2018" => 2587,
            "2019" => 2672,
            "2020" => 2695
          },
          "Mayk" => %{
            "2016" => 2644,
            "2017" => 2735,
            "2018" => 2770,
            "2019" => 2778,
            "2020" => 2599
          },
          "Rafael" => %{
            "2016" => 2684,
            "2017" => 2570,
            "2018" => 2628,
            "2019" => 2786,
            "2020" => 2929
          },
          "Vinicius" => %{
            "2016" => 2530,
            "2017" => 2720,
            "2018" => 2654,
            "2019" => 2640,
            "2020" => 2868
          }
        }
      }

      response = FreelaReports.build(file_name)

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "when is given a list of file names return the report" do
      file_names = ["part_1.csv", "part_2.csv"]

      expected_response =
        {:ok,
         %{
           all_hours: %{
             "Cleiton" => 9093,
             "Daniele" => 8710,
             "Danilo" => 9305,
             "Diego" => 8683,
             "Giuliano" => 8859,
             "Jakeliny" => 9237,
             "Joseph" => 8739,
             "Mayk" => 8892,
             "Rafael" => 9043,
             "Vinicius" => 9216
           },
           hours_per_month: %{
             "Cleiton" => %{
               "abril" => 740,
               "agosto" => 777,
               "dezembro" => 700,
               "fevereiro" => 741,
               "janeiro" => 866,
               "julho" => 828,
               "junho" => 769,
               "maio" => 672,
               "março" => 672,
               "novembro" => 783,
               "outubro" => 717,
               "setembro" => 828
             },
             "Daniele" => %{
               "abril" => 795,
               "agosto" => 651,
               "dezembro" => 595,
               "fevereiro" => 666,
               "janeiro" => 703,
               "julho" => 820,
               "junho" => 764,
               "maio" => 822,
               "março" => 765,
               "novembro" => 692,
               "outubro" => 659,
               "setembro" => 778
             },
             "Danilo" => %{
               "abril" => 821,
               "agosto" => 855,
               "dezembro" => 707,
               "fevereiro" => 773,
               "janeiro" => 801,
               "julho" => 741,
               "junho" => 650,
               "maio" => 787,
               "março" => 848,
               "novembro" => 734,
               "outubro" => 865,
               "setembro" => 723
             },
             "Diego" => %{
               "abril" => 751,
               "agosto" => 730,
               "dezembro" => 782,
               "fevereiro" => 703,
               "janeiro" => 693,
               "julho" => 780,
               "junho" => 679,
               "maio" => 754,
               "março" => 730,
               "novembro" => 688,
               "outubro" => 609,
               "setembro" => 784
             },
             "Giuliano" => %{
               "abril" => 793,
               "agosto" => 709,
               "dezembro" => 677,
               "fevereiro" => 746,
               "janeiro" => 715,
               "julho" => 735,
               "junho" => 775,
               "maio" => 809,
               "março" => 728,
               "novembro" => 705,
               "outubro" => 750,
               "setembro" => 717
             },
             "Jakeliny" => %{
               "abril" => 849,
               "agosto" => 731,
               "dezembro" => 755,
               "fevereiro" => 770,
               "janeiro" => 809,
               "julho" => 825,
               "junho" => 793,
               "maio" => 681,
               "março" => 814,
               "novembro" => 648,
               "outubro" => 766,
               "setembro" => 796
             },
             "Joseph" => %{
               "abril" => 676,
               "agosto" => 806,
               "dezembro" => 763,
               "fevereiro" => 787,
               "janeiro" => 769,
               "julho" => 796,
               "junho" => 751,
               "maio" => 721,
               "março" => 633,
               "novembro" => 627,
               "outubro" => 660,
               "setembro" => 750
             },
             "Mayk" => %{
               "abril" => 654,
               "agosto" => 723,
               "dezembro" => 814,
               "fevereiro" => 763,
               "janeiro" => 706,
               "julho" => 796,
               "junho" => 742,
               "maio" => 763,
               "março" => 706,
               "novembro" => 811,
               "outubro" => 678,
               "setembro" => 736
             },
             "Rafael" => %{
               "abril" => 738,
               "agosto" => 786,
               "dezembro" => 612,
               "fevereiro" => 693,
               "janeiro" => 762,
               "julho" => 725,
               "junho" => 813,
               "maio" => 787,
               "março" => 827,
               "novembro" => 773,
               "outubro" => 826,
               "setembro" => 701
             },
             "Vinicius" => %{
               "abril" => 780,
               "agosto" => 712,
               "dezembro" => 816,
               "fevereiro" => 747,
               "janeiro" => 765,
               "julho" => 682,
               "junho" => 775,
               "maio" => 791,
               "março" => 879,
               "novembro" => 759,
               "outubro" => 723,
               "setembro" => 787
             }
           },
           hours_per_year: %{
             "Cleiton" => %{
               "2016" => 1822,
               "2017" => 1723,
               "2018" => 1894,
               "2019" => 1823,
               "2020" => 1831
             },
             "Daniele" => %{
               "2016" => 1765,
               "2017" => 1875,
               "2018" => 1777,
               "2019" => 1627,
               "2020" => 1666
             },
             "Danilo" => %{
               "2016" => 1788,
               "2017" => 1821,
               "2018" => 2098,
               "2019" => 1867,
               "2020" => 1731
             },
             "Diego" => %{
               "2016" => 1689,
               "2017" => 1771,
               "2018" => 1871,
               "2019" => 1663,
               "2020" => 1689
             },
             "Giuliano" => %{
               "2016" => 1822,
               "2017" => 1782,
               "2018" => 1668,
               "2019" => 1892,
               "2020" => 1695
             },
             "Jakeliny" => %{
               "2016" => 1911,
               "2017" => 1744,
               "2018" => 1802,
               "2019" => 1817,
               "2020" => 1963
             },
             "Joseph" => %{
               "2016" => 1776,
               "2017" => 1812,
               "2018" => 1580,
               "2019" => 1749,
               "2020" => 1822
             },
             "Mayk" => %{
               "2016" => 1770,
               "2017" => 1716,
               "2018" => 1857,
               "2019" => 1872,
               "2020" => 1677
             },
             "Rafael" => %{
               "2016" => 1820,
               "2017" => 1632,
               "2018" => 1734,
               "2019" => 1861,
               "2020" => 1996
             },
             "Vinicius" => %{
               "2016" => 1821,
               "2017" => 1816,
               "2018" => 1830,
               "2019" => 1779,
               "2020" => 1970
             }
           }
         }}

      response = FreelaReports.build_from_many(file_names)

      assert response == expected_response
    end

    test "when is not given a list of file names return error" do
      file_names = "banana"

      expected_response = {:error, "Please provide a list of file names"}

      response = FreelaReports.build_from_many(file_names)

      assert response == expected_response
    end
  end
end
