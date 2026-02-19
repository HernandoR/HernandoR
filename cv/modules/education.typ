#import "../brilliant-CV/template.typ": *

#cvSection("Education")

#cvEntry(..languageSwitch((
  "en": (
    title: [Master of Science, Electronics],
    society: [Nanyang Technological University],
    date: [2022 - 2024],
    location: [Singapore],
    logo: "../src/logos/NTU.png",
    description: (
      list(
          [#cvHighlight("GPA: 3.88/5.0")],
          [Dissertation: Trajectory tracking based on #cvHighlight("Multi-layered Continuous Network")],
          [Course: Analog IC design #hBar() 
          Digital IC design	#hBar() 
          #cvHighlight("Genetic Algorithms & Machine Learning")]
          )
    )
  ),
  "zh": (
    title: [理学硕士, 电子学],
    society: [南洋理工大学],
    date: [2022 - 2024],
    location: [新加坡],
    logo: "../src/logos/NTU.png",
    description: (
      list(
          [#cvHighlight("GPA: 3.88/5.0")],
          [学位论文: 基于#cvHighlight("多层连续网络")的轨迹跟踪],
          [课程: 模拟集成电路设计 #hBar() 
          数字集成电路设计 #hBar() 
          #cvHighlight("遗传算法与机器学习")]
          )
    )
  )
  )
))

#cvEntry(..languageSwitch((
  "en": (
    title: [Bachelors of Engineering, Electronical Information Engineering],
    society: [Wuhan University of Science and Technology],
    date: [2018 - 2022],
    location: [Hubei, China],
    logo: "../src/logos/WUST.png",
    description: (
      list(
          [#cvHighlight("GPA: 3.68/4.0")],
          [Thesis: Implementation of #cvHighlight("multi-threaded distributed SLAM") in outdoor environment],
          [Course: Digital System Design (Verilog HDL) #hBar()
            #cvHighlight("Probability and Mathematical Statistics")]
          )
    )
  ),
  
  "zh": (
    title: [工学学士, 电子信息工程],
    society: [武汉科技大学],
    date: [2018 - 2022],
    location: [湖北, 中国],
    logo: "../src/logos/WUST.png",
    description: (
      list(
          [#cvHighlight("GPA: 3.68/4.0")],
          [毕业设计: 室外环境下#cvHighlight("多线程分布式SLAM")系统的实现],
          [数字系统设计(Verilog HDL) #hBar() 
            无线通信 #hBar() 
            概率统计 #hBar() 
            #cvHighlight("信号处理")]
          )
    )
  )
  )
))

// #cvEntry(..i18nSW((
//   title: (
//     "en":[Master of Science, Electronics],
//     "zh":[理学硕士, 电子学]
//   ),
//   society: (
//     "en":[Nanyang Technological University],
//     "zh":[南洋理工大学]
//   ),
//   date: [2022 - 2024],
//   location: [Singapore],
//   logo: "../src/logos/NTU.png",
//   description: (
//     "en":
//       list(
//           // [Dissertation: Decentrolized SLAM Swarm],
//           [Course: Analog IC design #hBar() 
//           Digital IC design	#hBar() 
//           Genetic Algorithms & Machine Learning],
//           [GPA: 3.88/5.0]
//           ),
//     "zh":
//       list(
//           // [毕业设计: 室外环境下多线程分布式SLAM系统的实现],
//           [课程: 模拟集成电路设计 #hBar() 
//           数字集成电路设计 #hBar() 
//           遗传算法与机器学习],
//           [GPA: 3.88/5.0]
//           )
//   )
// )))

// #cvEntry(..i18nSW((
//   title: (
//     "en":[Bachelors of Engineering, Electronical Information Engineering],
//     "zh":[工学学士, 电子信息工程]
//   ),
//   society: (
//     "en": [Wuhan University of Science and Technology],
//     "zh": [武汉科技大学]
//   ),
//   date: [2018 - 2022],
//   location: (
//     "en": [Hubei, China],
//     "zh": [湖北, 中国]),
//   logo: "../src/logos/WUST.png",
//   description: (
//     "en": 
//       list(
//           [Thesis: Implementation of multi-threaded distributed SLAM system in outdoor environment],
//           [Course: Digital System Design (Verilog HDL) #hBar()
//             Probability and Mathematical Statistics #hBar()
//             Digital Signal Processing],
//             [GPA: 3.68/4.0]
//           ),
//     "zh": 
//       list(
//           [毕业设计: 室外环境下多线程分布式SLAM系统的实现],
//           [数字系统设计(Verilog HDL) #hBar() 
//             无线通信 #hBar() 
//             概率统计 #hBar() 
//             信号处理],
//           [GPA: 3.68/4.0]
//           )
//   )
// )))
