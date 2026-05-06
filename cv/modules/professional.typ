#import "../brilliant-CV/template.typ": *

#cvSection("Professional Experience")

#cvEntry(..languageSwitch((
  "en": (
    title: [ Algorithm Engineer ],
    society: [ Xiaomi Corporation],
    date: [ 2024.07 - now],
    location: [ Wuhan, China ],
    description: list(
      [Built the *multi-vehicle multi-trip* ground truth data production pipeline from scratch, #cvHighlight("improving data annotation efficiency by 500%+")],
      [Aligned with annotation/support teams to design labeling system and annotation specifications],
      [Trained feed-forward models for visual reconstruction on #cvHighlight("multi-GPU") setups],
      [Completed training and data effect validation of visual reconstruction models based on multi-GPU clusters, iteratively refining data filtering and cleaning rules],
      [Developed and deployed an internal Python SDK for training data production & asset management, standardizing data processing pipelines],
      [Promoted the adoption of uv within the team, simplifying environment configuration],
      [Refactored project architecture to enable automatic docker image packaging],
      [Keywords: 3D reconstruction, machine learning, data engineering, deep learning, algorithm optimization]
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
      [与标注/支持团队对齐，设计标签体系与标注规范],
      [在#cvHighlight("多 GPU")上训练视觉重建的前馈模型],
      [基于多GPU集群完成视觉重建模型训练与数据效果验证，反向迭代数据筛选与清洗规则],
      [自研并落地内部训练数据生产&资产管理Python SDK，标准化数据处理流水线],
      [推动 uv 在团队中落地使用，简化环境配置],
      [重构项目架构，实现自动docker image 封装],
      [关键词: 3D重建, 机器学习, 数据工程, 深度学习, 算法优化]
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