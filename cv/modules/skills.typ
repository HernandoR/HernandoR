#import "../brilliant-CV/template.typ": *

#cvSection("Skills")

#cvSkill(..languageSwitch((
  "en":(
    type: [Languages],
    info: [English - Professional fluent #hBar() Mandarin - Native]
  ),
  "zh":(
    type: [Languages],
    info: [英语 - 专业流利 #hBar() 中文 - 母语]
  )
)))

#cvSkill(..languageSwitch((
  "en":(
    type: [Tech Stack],
    info: [Mathmetical model #hBar() Python (Pandas/Numpy) #hBar() Rust #hBar() Computer Vision #hBar() 3D reconstracture #hBar() Machine Learning(PyTorch) #hBar git #hBar() Tableau]
  ),
  
  "zh":(
    type: [Tech Stack],
    info: [Python (PyTorch/Pandas/Numpy) #hBar() Rust #hBar() 计算机视觉 #hBar() 3D重建 #hBar() 机器学习(PyTorch) #hBar() git #hBar() Tableau]
  )
)))

// #cvSkill(
//   type: [Languages],
//   info: languageSwitch((
//     "en":[English - Professional fluent #hBar() Mandarin - Native],
//     "zh":[英语 - 专业流利 #hBar() 中文 - 母语]
//   )),
// )

// #cvSkill(
//   type: [Tech Stack],
//   info: languageSwitch((
//       "en":[Python (Pandas/Numpy) #hBar() Computer Vision #hBar() 3D reconstracture #hBar() Machine Learning(PyTorch) #hBar git #hBar() Tableau],
//       "zh":[Python (Pandas/Numpy) #hBar() 计算机视觉 #hBar() 3D重建 #hBar() 机器学习(PyTorch) #hBar git #hBar() Tableau]
//       ))
// )

// #cvSkill(
//   type: [Personal Interests],
//   info: [Swimming #hBar() Cooking #hBar() Reading]
// )
