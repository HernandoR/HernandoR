#import "../brilliant-CV/template.typ": *

#cvSection("Professional Experience")

#cvEntry(..languageSwitch((
  "en": (
    title: [ Algorithm Engineer ],
    society: [ Xiaomi Corporation],
    date: [ 2024.07 - now],
    location: [ Wuhan, China ],
    description: list(
      [Built a multi-vehicle, multi-trip ground truth data pipeline from scratch, #cvHighlight("improving data annotation efficiency by 500%+")],
      [Train models with internal datasets for ground truth generation in production scenarios],
      [Trained and deployed a feed-forward model for scene reconstruction on #cvHighlight("multi-GPU infrastructure")],
      [Developed and released a #cvHighlight("Python SDK") for internal training data production and management],
      [Keywords: 3D reconstruction, machine learning, deep learning, algorithm optimization]
    ),
    logo: "../src/logos/xiaomi.png",
  ),

  "zh": (
    title: [ 算法工程师 ],
    society: [ 小米科技 ],
    date: [ 2024.07 - 至今],
    location: [ 武汉, 中国 ],
    description: list(
      [从 0-1 建设*多车多趟*真值数据生产链路，#cvHighlight("数据标注效率提升 500%+")],
      [用内部数据集训练模型，用于生产场景真值],
      [在#cvHighlight("多 GPU")上训练和部署用于场景重建任务的前馈模型],
      [开发并发布用于内部训练数据生产和管理的#cvHighlight("Python SDK")],
      [关键词: 3D重建, 机器学习, 深度学习, 算法优化]
    ),
    logo: "../src/logos/xiaomi.png",
  )
)))

// #cvEntry(
//     title: [Director of Data Science],
//     society: [XYZ Corporation],
//     logo: "../src/logos/xyz_corp.png",
//     date: [2020 - Present],
//     location: [San Francisco, CA],
//     description: list(
//       [Lead a team of data scientists and analysts to develop and implement data-driven strategies, develop predictive models and algorithms to support decision-making across the organization],
//       [Collaborate with executive leadership to identify business opportunities and drive growth, implement best practices for data governance, quality, and security],
//     )
// )

// #cvEntry(
//     title: [Data Analyst],
//     society: [ABC Company],
//     logo: "../src/logos/abc_company.png",
//     date: [2017 - 2020],
//     location: [New York, NY],
//     description: list(
//       [Analyze large datasets using SQL and Python, collaborate with cross-functional teams to identify business insights],
//       [Create data visualizations and dashboards using Tableau, develop and maintain data pipelines using AWS],
//     )
// )

// #cvEntry(
//     title: [Data Analysis Intern],
//     society: [PQR Corporation],
//     logo: "../src/logos/pqr_corp.png",
//     date: [Summer 2017],
//     location: [Chicago, IL],
//     description: list(
//       [Assisted with data cleaning, processing, and analysis using Python and Excel, participated in team meetings and contributed to project planning and execution],
//       [Developed data visualizations and reports to communicate insights to stakeholders, collaborated with other interns and team members to complete projects on time and with high quality],
//     )
// )