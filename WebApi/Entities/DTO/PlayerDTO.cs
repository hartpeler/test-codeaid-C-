namespace WebApi.Entities.DTO
{
    public class PlayerDTO
    {
        public string Name { get; set; }
        public string Position { get; set; }
        public List<PlayerSkillDTO> PlayerSkills { get; set; }
    }
}
